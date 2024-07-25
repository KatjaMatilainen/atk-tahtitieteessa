;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ATK tähtitieteessä
;; Harjoitus 5. - Tehtävä 1.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Luodaan ensin tasavälisesti lukuja väliltä [-10,10] käyttäen
; findgen-funktiota.

x=findgen(200)/10. - 10.

; Luodaan y käyttäen ensin paraabelin yhtälöä. Määritetään vakiot myös
; satunnaislukuina.
a=randomn(seed,1)
b=randomn(seed,1)
c=randomn(seed,1)

; Koska randomn palauttaa taulukon, on meidän käytettävä niistä vain
; ensimmäinen indeksi, jotta laskutoimitus toimii.
y = a(0) + b(0) * x + c(0) * x^2.

; Lisätään taulukkoon y hälyä. Huomaa, että randomn-funktiossa luodaan
; saman verran satunnaislukuja kuin mitä taulukossa y
; on alkioita. Kerrotaan vielä varmuuden vuoksi
; satunnaislukutaulukkoa, jotta saamme kunnolla hälyä.
y= y + randomn(seed,200) * 2.


; Sovitus käyttäen poly_fit-funktiota. Kutsussa määritetään
; sovitettavan polynomin aste, ja vektori johon y-sovitus tallennetaan.
apu=poly_fit(x,y,2,yfit=y_sovitus)

; Piirretään data ja sovitus sen päälle.
kuvaaja=plot(x,y,linestyle='none',symbol='circle',xtitle='X',ytitle='Y',$
             title='Toisen asteen yhtälö',name='Data')
sovitus=plot(x,y_sovitus,thick=2,color='red',/overplot,name='Sovitus')

; Dataselitys legend-funktiolla kuvaajan oikeaan yläkulmaan.
selitys=legend(target=[kuvaaja,sovitus],position=[0.9,0.85])

; Tulostetaan vielä alkuperäiset ja sovitetut parametrit.


print,'Toisen asteen funktioiden parametrit.'
print,'Alkuperaiset:'
print,'a=',a
print,'b=',b
print,'c=',c
print,'Sovitetut'
print,'a=',apu(0)
print,'b=',apu(1)
print,'c=',apu(2)





; Toistetaan sama, mutta käytetään kolmannen asteen polynomia ja siten
; vielä edelleen yhtä vakiota.

x=findgen(200)/10. - 10.

a=randomn(seed,1)
b=randomn(seed,1)
c=randomn(seed,1)
d=randomn(seed,1)

y = a(0) + b(0) * x + c(0) * x^2. + d(0) * x^3.

y= y + randomn(seed,200) * 4.

apu=poly_fit(x,y,3,yfit=y_sovitus)


kuvaaja=plot(x,y,linestyle='none',symbol='circle',xtitle='X',ytitle='Y',$
             title='Kolmannen asteen yhtälö',name='Data')
sovitus=plot(x,y_sovitus,thick=2,color='red',/overplot,name='Sovitus')

; Dataselitys legend-funktiolla kuvaajan oikeaan yläkulmaan.
selitys=legend(target=[kuvaaja,sovitus],position=[0.9,0.85])

; Tulostetaan vielä alkuperäiset ja sovitetut parametrit.

print,'Kolmannen asteen funktioiden parametrit.'
print,'Alkuperaiset:'
print,'a=',a
print,'b=',b
print,'c=',c
print,'d=',d
print,'Sovitetut'
print,'a=',apu(0)
print,'b=',apu(1)
print,'c=',apu(2)
print,'d=',apu(3)

end
