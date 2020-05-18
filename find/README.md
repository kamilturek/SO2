# Zadania

1. W zadanym drzewie katalogów znaleźć podkatalogi, do których właściciel nie ma prawa odczytu lub prawa
wykonania, natomiast ktoś inny (właściciel grupowy lub nie) ma prawo zapisu. Skrypt nie powinien zakładać
żadnych dodatkowych warunków dotyczących praw dostępu.

2. W zadanym drzewie katalogów znaleźć katalogi zawierające mniej niż $2 (zadany parametr), a więcej lub równo $3
podkatalogi. Skrypt musi uwzględniać ostrość nierówności!

3. Dla zadanych dwóch drzew katalogów utworzyć trzecie, będące częścią wspólną dwóch pierwszych. Aby utworzyć kopię, pliki/katalogi/dowiązania muszą się w obu tak samo nazywać i mieć ten sam typ. Zawartość pliku regularnego lub ścieżka dowiązania są nieistotne. W kopii zawsze jest to kopia z drzewa pierwszego.

4. W zadanym drzewie katalogów znaleźć dowiązania symboliczne wskazujące na pliki regularne, zmodyfikowane nie wcześniej niż 5 minut temu i nie później niż $2 (argument skryptu) minut temu.

5. Skopiować zadane drzewo katalogów w zadane miejsce, uwzględniając pliki regularne, podkatalogi oraz dowiązania symboliczne. Dowiązania symboliczne w kopii powinny wskazywać na pierwotne obiekty.

6. Napisz skrypt, który przeszuka zadane miejsce w systemie plików (parametr wywołania skryptu), o ile ono istnieje, i wyświetli wszystkie istniejące w tym miejscu (i jego ewentualnych podkatalogach) dowiązania twarde i miękkie do wskazanego pliku (parametr wywołania skryptu).

7. Napisz skrypt, który z zadanego miejsca systemu plików (parametr wywołania skryptu), uwzględniając wszystkie możliwe podkatalogi, wypisze ścieżki do N (opcjonalny parametr wywołania skryptu; domyślnie 10) największych (pod względem rozmiaru w bajtach) plików.