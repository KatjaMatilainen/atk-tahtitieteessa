;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ATK tähtitieteessä
;; Harjoitus 3. - Tehtävä 1.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;Tehdään ensin tehtävänanto FOR-rakenteella.
print,'For-rakenteella:'

; Määritellään ensin muuttuja x tyhjäksi taulukoksi.
; Elementtien määrä on 101 jotta saamme luvut 0, 1, ..., 100.
x=fltarr(101)   

; Aloitetaan for-rakenne.
; Muuttuja i käy välin 0-100 silmukassa.
for i=0,100 do begin
   
   ; Tallennetaan i:n arvo muuttujaan x aina i-indeksiin
   x(i)=i

   ; Käytetään if/else-rakennetta tulostamaan 
   ; jotain yllättävää kun x=50, muutoin pelkkä
   ; x:n arvo.
   if( x(i) eq 50 ) then begin
      print,'Jotain yllattavaa.'
   endif else begin
      print,x(i)
   endelse

   ; Suljetaan silmukka.
endfor


;; Vastaava käyttäen while-rakennetta.
print,'While-rakenteella:'

; Alustetaan muuttuja x uudestaan taulukoksi
x=fltarr(101)

; Määritetään muuttuja i jota muutetaan silmukassa nyt itse.
i=0.

; Aloitetaan while-rakenne. Eli silmukkaa toistetaan kunnes 
; i on pienempi tai yhtäsuuri kuin 100.
while i le 100. do begin

   ; Tallennetaan jälleen i:n arvo x:n indeksiin.
   x(i)=i

   ; Tulostetaan x:n arvo kuten for-silmukassa.
   if( x(i) eq 50 ) then begin
      print,'Jotain yllattavaa.'
   endif else begin
      print,x(i)
   endelse

   ; Muutetaan i:n arvoa.
   i=i+1.

   ; Lopetetaan rakenne.
endwhile


; Lopetetaan ohjelma.
end
