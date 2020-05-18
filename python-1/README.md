# Zadania

1. W zadanym katalogu utwórz pliki regularne o nazwach pokrywajacych się z kolejnymi liniami w zadanym pliku (tworzyć również pliki ze spacjami w nazwie). Jeżeli plik o takiej nazwie już istnieje, to zmień prawa jego dostępu na "read only". Jeżeli obiekt o takiej nazwie istnieje, a nie jest plikiem regularnym, to wyświetl ostrzeżenie i nie zmieniaj go.

2. W zadanym katalogu przerób wszystkie dowiązania symboliczne wskazujące na pliki regularne (do których wykonujący skrypt nie ma prawa zapisu) znajdujące się w tym katalogu, tak aby ścieżki dowiązania miały postać ./plik.

3. Dla zadanego dowiązania symbolicznego zweryfikuj, czy cała ścieżka do obiektu przez niego wskazanego znajduje się w obrębie zadanego drzewa katalogów (wszystkie pośrednie katalogi i dowiązania występujące w ścieżce). Uwaga: weryfikacja ma sprawdzić ścieżkę zapisaną w dowiązaniu, a nie przerobioną do postaci kanonicznej (bo to nie jest to samo).

4. W zadanym katalogu przerób wszystkie dowiązania symboliczne wskazujące na pliki regularne (do których wykonujący skrypt nie ma prawa zapisu), tak aby ścieżki w dowiązaniach były bezwzględne.

5. Skopiować zadany katalog $1 do nowo utworzonego miejsca $2 (jeżeli $2 już istnieje, to komunikat błędu). W kopii wszystkie pliki regularne muszą mieć swoje kopie, katalogi muszą mieć puste odpowiedniki o tej samej nazwie, kopie dowiązań symbolicznych wskazujących poza katalog muszą wskazywać na ten sam obiekt co pierwowzór, kopie dowiązań wskazujących na obiekty w katalogu pierwotnym powinny wskazywać na ich kopie w drugim katalogu.