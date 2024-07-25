;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ATK tähtitieteessä
;; Harjoitus 3. - Tehtävä 3.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Tarkoituksena on siis tehdä edellisen harjoituksen
;; heittoliiketehtävä käyttäen aliohjelmaa.

; Määritellään ensin aliohjelmakutsu, jossa:
; harj3_teht3 = aliohjelman nimi
; vx = x-suuntaiset alkunopeudet sisältävä skalaari/taulukko.
; vy = y-suuntaiset alkunopeudet sisältävä skalaari/taulukko.
pro harj3_teht3,vx,vy

; Ohjelma käännetään komennolla:
;  .run harj3_teht3.pro
; Ja esimerkiksi alkunopeusparilla sitä voi kutsua komennolla:
;  harj3_teht3, [2., 5.], [3., 4.]
; tai
;  harj3_teht3, 2., 5.
; jos alkunopeuksia on vain yksi.


; Tarkastetaan montako elementtiä alkunopeuksissa on.
; Tämä tehdään n_elements-funktiolla:
nx=n_elements(vx)
ny=n_elements(vy)

; Kuten tehtävänannossa sanottiin, jos x- ja y-suuntaisia
; alkunopeuksia on eri määrä ohjelma pysäytetään, ja alkunopeuksien
; lukumäärät tulostetaan.
; Tehdään tämä if-lauseella.
if(nx ne ny) then begin

   print,'n(vx) != n(vy), ohjelma lopetetaan.'
   print,'      n(vx):       n(vy):'

   ; Käytetään stop-rakennetta pysäyttämään ohjelma, ja tulostamaan
   ; alkunopeuksien määrä.
   stop,nx,ny

endif


; Määritetään painovoiman kiihtyvyys muuttujaan g.
g=9.81

; Luodaan ajalle taulukko t joka sisältää nyt luvut
; 0, 0.1, 0.2, ..., 99.9. Sadan sekunnin pitäisi riittää
; normaalin ihmisen heittoliikkeen radan laskemiseen,
; ainakin normaaleissa tilanteissa.
t=findgen(1000)/10.

; Itse heittoliikkeen laskeminen tehdään silmukassa, joka 
; toistaa itseään niin monta kertaa kuin alkunopeuksia on (eli nx-1
; kertaa).
; Tämän silmukan sisällä tehdään myös kuvaajien piirto.
for i=0,nx-1 do begin

   ; Lasketaan x ja y koordinaatit alkunopeuden indeksillä i:
   x=vx(i)*t
   y=vy(i)*t-0.5*g*t^2

   ; Tarkistetaan nyt if-lauseella jos kyseessä on ensimmäinen 
   ; alkunopeus. Jos näin on, niin avataan uusi ikkuna ja 
   ; piirretään kuvaaja plot-proseduurilla.
   if(i eq 0) then begin

      ; Lasketaan myös  kuvaajien piirtämistä helpottavia parametreja.
      ; Ensin tarkistetaan suurin indeksi missä pystytään maan pinnan
      ; yläpuolella (y>0) ja lisätään siihen viisi metriä.
      ; toiseksi tarkistetaan heiton ylin kohta ja lisätään siihen 
      ; viisi metriä.
      ; Näillä parametreilla voidaan määrittää kuvaajan akselien 
      ; suurimmat arvot.
      x_max=x( max( where(y ge 0.) ) ) + 5.
      y_max=max(y)+5.

      ; Avataan 800x500 pikselin kokoinen ikkuna vapaaseen ikkunaan.
      window,/free,xsize=800,ysize=500
      
      ; Piirretään kuvaaja, määritetään akselin arvovälit, 
      ; ja akselien otsikot.
      plot,x,y,xrange=[0,x_max],yrange=[0,y_max],$
           xtitle='Pituus [m]',ytitle='Korkeus [m]'

      ; Jos jokin muu kuin ensimmäinen alkunopeus, niin käytetään
      ; oplot-proseduuria piirtämään edellisen kuvaajan päälle.
   endif else begin

      ; Määritetään päälle piirrettävälle alkunopeudelle väri i+1.
      oplot,x,y,color=i+1
   endelse

endfor



; Lopetetaan ohjelma.
end
