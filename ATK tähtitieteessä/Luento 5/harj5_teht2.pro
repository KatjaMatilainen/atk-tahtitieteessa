;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ATK tähtitieteessä
;; Harjoitus 5. - Tehtävä 2.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Avataan tiedostot restore-komennolla.
restore,'galaxies.save'
restore,'open_clusters.save'

; Piirretään galaksien koordinaatit.
window,/free
plot,ra,dec,psym=3,xtitle='rektaskensio',ytitle='deklinaatio'

; Jakaumassa voi nähdä joitain galaksikeskittymiä (esim. Virgon
; galaksijoukko hieman oikealle kuvan keskeltä yläreunassa), ja
; havaintojen laajuudesta ja syvyydestä johtuvia teräviä rajoja.

; Piirretään päälle tähtijoukot

window,/free
plot,ra,dec,psym=3,xtitle='rektaskensio',ytitle='deklinaatio'
oplot,ocra,ocdec,psym=6,color=2,symsize=0.5,thick=3.

; Suurin osa tähtijoukoista näyttää osuvat aiemmin tyhjään alueeseen.
; Tämä on oman galaksimme kiekon taso, jonka läpi emme näe toisia
; galakseja mutta joka on täynnä tähtijoukkoja.
; Kuvaajan alalaidassa on myös kaksi keskittymää. Nämä ovat vasemmalta
; katsoen Pieni Magellanin Pilvi ja Iso Magellanin Pilvi, jotka ovat
; Linnunradan seuralaisgalakseja.


; Käytetään nyt glactc-ohjelmaa muuntamaan koordinaatit galaktisiin
; koordinaatteihin.

; Ensin galakseille.
glactc,ra,dec,2000,gal_gl,gal_gb,1

; Ja tähtijoukoille.
glactc,ocra,ocdec,2000,oc_gl,oc_gb,1


; Ja piirretään nämä jakaumat.
window,/free
plot,gal_gl,gal_gb,psym=3,$
     xtitle='galaktinen longitudi',ytitle='galaktinen latitudi'
oplot,oc_gl,oc_gb,psym=6,color=2,symsize=0.5,thick=3.

; Nyt Linnunradan kiekon taso on vaakasuorassa ilman "kummallista"
; kiemuraa. Linnunradan keskusta on tässä origossa, ja galaktinen
; longitudi kasvaa keskustasta itään.


; Seuraavaa kohtaa varten lasketaan ensin etäisyydet.
dist=v/75.d0

; Tämän jälkeen voidaan etsiä mitkä galaksit löytyvät
; deklinaatioväliltämme.
ind=where(dec ge -5. and dec le 5.)

; Ja lopuksi voimme piirtää halutun kuvaajan. Tässä etäisyyksiä
; rajoitetaan tuhanteen megaparsekkiin, jotta filamenttirakenne jossa
; galaksit ovat on selvemmin näkyvillä.
window,/free
plot,dist(ind),ra(ind),psym=3,xr=[0,1000]

end
