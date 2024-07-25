;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ATK tähtitieteessä
;; Harjoitus 4.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Tämä tiedosto sisältää kaikki harjoituksen 
;; eri tehtävät. Aja se IDL-komentorivissä 
;; komennolla: .run harj4_malli.pro






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tehtävä 1.


; Määritetään ensin kurssin wikisivuilta ladatun
; tiedoston nimi muuttujaan.
file='table2.dat'

; Tarkastetaan montako riviä tässä tiedostossa on.
n=file_lines(file)

; Ja luodaan tätä käyttäen muuttujat mihin haluttu 
; data tallennetaan.
x=fltarr(n)
y=fltarr(n)
v=fltarr(n)
bv=fltarr(n)

; Avataan tiedosto lukua varten.
openr,1,file

; Käytetään silmukkaa itse lukuun.
for i=0,n-1 do begin

   ; Tässä tapahtuu itse tiedoston luku rivi kerrallaan
   ; väliaikaismuuttujiin. Huomaa, että väliaikaismuuttujia
   ; on sama määrä kuin sarakkeita tiedostossa.
   readf,1,temp1,temp2,temp3,temp4,temp5

   ; Tallennetaan data muuttujiin.
   x(i)=temp2
   y(i)=temp3
   v(i)=temp4
   bv(i)=temp5
endfor

; Suljetaan tiedosto.
close,1

; Tarkastetaan ensin näyttävätkö tähtien koordinaatit lainkaan
; oikealta tähtijoukolta.
; Avataan ikkuna window komennolla, ja käytetään avainsanaa
; /iso plot-komennossa, jolloin akselien pituudet ovat samat.
window,/free,xsize=600,ysize=600
plot,x,y,psym=6,symsize=0.2,/iso,title='M53 - all stars',xtitle='X',ytitle='Y'

; Tämä tosiaan ei vielä kovin muistuta oikeaa kuvaa.

; Rajoitetaan nyt tähdet vain magnitudia 20 kirkkaampiin
; where-lauseella. Magnitudin määrittelystä johtuen kirkkaampi
; magnitudi tarkoittaa pienempää lukuarvoa.
ind=where(v lt 20)
window,/free,xsize=600,ysize=600
plot,x(ind),y(ind),psym=6,symsize=0.2,/iso,$
     title='M53 - stars with mag < 20',xtitle='X',ytitle='Y'

; Ja kuvaaja on paljon lähempänä oikeaa kuvaa.

; Luodaan lopuksi HR-diagramma tähdistä kuten tehtävänannossa neuvotaan.
window,/free,xsize=600,ysize=600
plot,bv,v,yr=[24,12],psym=6,symsize=0.2,xtitle='B-V',ytitle='V',title='M53'









;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tehtävä 2.

; Eli lasketaan magnitudin ja väri-indeksin keskiarvot annetulla
; kaavalla. Funktio total antaa taulukon alkioiden summan, ja
; n_elements taulukon alkioiden lukumäärän.
v_mean= total(v) / n_elements(v)
bv_mean= total(bv) / n_elements(bv)

; Vastaavasti IDL:ssä on oma funktio keskiarvon laskemiselle.
v_mean_idl= mean(v)
bv_mean_idl= mean(bv)

; Tulostetaan nämä ja tarkistetaan että arvot ovat samat.
print,'Keskiarvot:  Kaava        IDL'
print,'V      ',v_mean,v_mean_idl
print,'B-V     ',bv_mean,bv_mean_idl

; Ja arvot vastaavat toisiaan.








;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tehtävä 3.

; Käytetään siis histogram-funktiota luomaan magnitudeista ja
; väri-indekseistä histogrammit.
v_histo = histogram(v, binsize=0.5, min=0., max=30., locations=v_temp)
bv_histo = histogram(bv, binsize=0.1, min=-5., max=5., locations=bv_temp)

; Kuten työohjeessa neuvottiin lasketaan nyt vielä binien
; keskipisteet.
v_x = v_temp + 0.5 * 0.5
bv_x = bv_temp + 0.5 * 0.1

; Käytetään ensin plot()-funktiota plottaamaan magnitudien
; histogrammi.
v_histo_plot=plot(v_x,v_histo,/histogram,xrange=[12,25],thick=2,$
                 xtitle='V',ytitle='N')

; Piirretään päälle keskiarvo y-akselin suuntaisena viivana kuten 
; ohjeessa neuvottiin.
v_mean_plot=plot( [v_mean, v_mean], [0,5000],linestyle='dash',$
                  color='red',thick=2,/overplot)

; Ja plot-proseduuria käyttäen sama väri-indeksille.
window,/free
plot,bv_x,bv_histo,psym=10,xrange=[-0.5,2.],thick=2,$
     xtitle='B-V',ytitle='N'

; Ja keskiarvo päälleplotattuna.
oplot, [bv_mean, bv_mean], [0,20000],color=2, linestyle=2, thick=2









;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tehtävä 4.

; Tallennetaan ensin IDL:n save-tiedostoon
save, x,y,v,bv, filename='m53_data.save'

; Kirjoitetaan sen jälkeen tiedostoon.
; Avataan ensin tiedosto kirjoitusta varten laitenumeroon 1.
openw, 1, 'm53_data.txt'

; Tarkistetaan kuinka monta elementtiä olikaan.
n=n_elements(x)

; Käytetään for-rakennetta kirjoittamiseen laitenumeroon 1.
for i=0,n-1 do printf, 1, x(i), y(i), v(i), bv(i)

; Suljetaan tiedosto
close,1



; Suljetaan ohjelma.
end
