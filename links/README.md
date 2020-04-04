# Zadania

1. Sprawdzić, czy zadane dowiązanie symboliczne (argument skryptu) wskazuje na podany obiekt. Rozwiązanie bazujące na porównaniu numerów inode'ów jest niewystarczające!

2. W zadanym katalogu ($1) znaleźć dowiązania symboliczne do obiektów w tym samym katalogu $1 i usunąć je.

3. W zadanym katalogu przerobić wszystkie dowiązania symboliczne, zdefiniowane ścieżkami względnymi, na równoważne zdefiniowane ścieżkami bezwzględnymi.

4. W zadanym katalogu przerobić wszystkie dowiązania twarde (pliki regularne) na dowiązania symboliczne.

4. Utworzyć kopię zadanego katalogu, przy czym dowiązania symboliczne, wskazujące na obiekty w katalogu, powinny w kopii wskazywać na kopie obiektów, natomiast dowiązania symboliczne wskazujące poza katalog powinny w kopii wskazywać na oryginalny obiekt. Podkatalogów nie należy kopiować (tylko pliki regularne i dowiązania).