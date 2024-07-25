;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ATK tähtitieteessä
;; Harjoitus 3. - Tehtävä 2. aliohjelmalla
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Eli tehdään tehdään tehtävä 1. käyttäen aliohjelmaa,
;; jonka kutsussa määrittelemme kuinka monta lukua haluamme
;; ja millä luvulla tulostamme jotain yllättävää.

; Määritellään aliohjelma seuraavalla rivillä, tässä tärkeät
; asiat ovat:
; harj3_teht2  = aliohjelman nimi, jolla sitä kutsutaan.
; x = taulukko joka voidaan palauttaa komentotilaan.
; n = kuinka monta lukua haluamme
; yllattava = millä luvulla haluamme jotain yllättävää.

function harj3_teht2_funktio, n, yllattava

; Ohjelma käännetään IDL-komentotilassa ensin:
;  .run harj3_teht2_funktio.pro
; Ja se ajetaan seuraavalla komennolla, jossa otetaan
; esimerkiksi 10 lukua ja luvulla 5 tulostetaan jotain 
; yllättävää:
;  x=harj3_teht2_funktio(10,5)



;;Tehdään ensin tehtävänanto FOR-rakenteella.
print,'For-rakenteella:'

; Määritellään ensin muuttuja x tyhjäksi taulukoksi.
; Elementtien määrä on n+1 jotta saamme luvut 0, 1, ..., n.
x=fltarr(n+1)   

; Aloitetaan for-rakenne.
; Muuttuja i käy välin 0-n silmukassa.
for i=0,n do begin
   
   ; Tallennetaan i:n arvo muuttujaan x aina i-indeksiin
   x(i)=i


   ; Käytetään if/else-rakennetta tulostamaan 
   ; jotain yllättävää kun x=yllattava, muutoin pelkkä
   ; x:n arvo.

   if( x(i) eq yllattava ) then begin
      print,'Jotain yllattavaa.'
   endif else begin
      print,x(i)
   endelse

   ; Suljetaan silmukka.
endfor




;; Vastaava käyttäen while-rakennetta.

print,'While-rakenteella:'

; Alustetaan muuttuja x uudestaan taulukoksi

x=fltarr(n+1)

; Määritetään muuttuja i jota muutetaan silmukassa nyt itse.

i=0.

; Aloitetaan while-rakenne. Eli silmukkaa toistetaan kunnes 
; i on pienempi tai yhtäsuuri kuin n.

while i le n do begin

   ; Tallennetaan jälleen i:n arvo x:n indeksiin.
   x(i)=i

   ; Tulostetaan x:n arvo kuten for-silmukassa.
   if( x(i) eq yllattava ) then begin
      print,'Jotain yllattavaa.'
   endif else begin
      print,x(i)
   endelse


   ; Muutetaan i:n arvoa.
   i=i+1.


   ; Lopetetaan rakenne.
endwhile



; Koska kyseessä on funktio, joudutaan palautettava muuttaja
; määrittelemään käyttäen return-proseduuria
return,x

; Lopetetaan ohjelma.
end
