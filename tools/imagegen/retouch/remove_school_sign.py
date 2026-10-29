"""Hayat Kasabası arka planındaki okul tabelasından İngilizce "SCHOOL" yazısını siler (görsellerde yazı yok kuralı).
Tabela yüzü elle çizilmiş çokgenle sınırlanır; açık renkli harfler doğrusal renk düzlemi + hafif parlaklık
gürültüsüyle doldurulur. Kullanım: uv run --with opencv-python-headless --with numpy python tools/imagegen/retouch/remove_school_sign.py <girdi> <çıktı> <karşılaştırma>"""
import cv2, numpy as np, sys
src, dst, dbgp = sys.argv[1:4]
im=cv2.imread(src)
x0,y0,x1,y1=380,360,580,460
roi=im[y0:y1,x0:x1].astype(np.float32)
hsv=cv2.cvtColor(im[y0:y1,x0:x1],cv2.COLOR_BGR2HSV)
poly=np.array([[37,37],[158,8],[165,36],[44,71]],np.int32)
inner=np.zeros(roi.shape[:2],np.uint8); cv2.fillPoly(inner,[poly],255)
letters=((hsv[...,1]<90)&(hsv[...,2]>120)).astype(np.uint8)*255 & inner
letters=cv2.dilate(letters,np.ones((7,7),np.uint8)) & inner
face=(inner>0)&(letters==0)
ys,xs=np.nonzero(face)
A=np.stack([np.ones_like(xs),xs,ys],1).astype(np.float64)
yy,xx=np.mgrid[0:roi.shape[0],0:roi.shape[1]]
B=np.stack([np.ones_like(xx),xx,yy],-1).reshape(-1,3).astype(np.float64)
fill=np.zeros_like(roi)
for ch in range(3):
    coef,*_=np.linalg.lstsq(A,roi[ys,xs,ch],rcond=None)
    fill[...,ch]=(B@coef).reshape(roi.shape[:2])
sd=float((roi[ys,xs]-fill[ys,xs]).mean(1).std())
noise=cv2.GaussianBlur(np.random.default_rng(0).normal(0,1,roi.shape[:2]).astype(np.float32),(0,0),1.0)
fill=fill+(noise/noise.std()*sd*0.8)[...,None]
m=cv2.GaussianBlur((letters>0).astype(np.float32),(0,0),1.5); m=np.clip(m*1.8,0,1)[...,None]
out=(roi*(1-m)+fill*m).clip(0,255).astype(np.uint8)
res=im.copy(); res[y0:y1,x0:x1]=out
cv2.imwrite(dst,res)
dbg=out.copy(); cv2.polylines(dbg,[poly],True,(0,0,255),1)
cv2.imwrite(dbgp,cv2.resize(np.hstack([im[y0:y1,x0:x1],out,dbg]),None,fx=3,fy=3,interpolation=cv2.INTER_NEAREST))
