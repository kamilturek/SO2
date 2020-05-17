# Zadania

1. W zadanym katalogu utwórz pliki regularne o nazwach pokrywajacych się z kolejnymi liniami w zadanym pliku (tworzyć również pliki ze spacjami w nazwie). Jeżeli plik o takiej nazwie już istnieje, to zmień prawa jego dostępu na "read only". Jeżeli obiekt o takiej nazwie istnieje, a nie jest plikiem regularnym, to wyświetl ostrzeżenie i nie zmieniaj go.

2. W zadanym katalogu przerób wszystkie dowiązania symboliczne wskazujące na pliki regularne (do których wykonujący skrypt nie ma prawa zapisu) znajdujące się w tym katalogu, tak aby ścieżki dowiązania miały postać ./plik.

3. Dla zadanego dowiązania symbolicznego zweryfikuj, czy cała ścieżka do obiektu przez niego wskazanego znajduje się w obrębie zadanego drzewa katalogów (wszystkie pośrednie katalogi i dowiązania występujące w ścieżce). Uwaga: weryfikacja ma sprawdzić ścieżkę zapisaną w dowiązaniu, a nie przerobioną do postaci kanonicznej (bo to nie jest to samo).