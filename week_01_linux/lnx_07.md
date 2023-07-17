# Bash scripting
Shell scripting is een belangrijk onderdeel van process automatisering in Linux. Het is een krachtig gereedschap voor het automatiseren van o.a. herhaaldelijke taken. Bash (Bourne Again SHell) is de standaard shell van Linux.

## Key-terms
- **Shell**: een Command Line Interpreter waarmee commands kunnen worden uitgevoerd.
- **Bash**: de standaard shell van Linux
- **Variables**: via bash kun je hier data opslaan en opvragen.

## Opdrachten

### Opdracht 1
- [x] Create a directory called ‘scripts’. Place all the scripts you make in this directory.
- [x] Add the scripts directory to the PATH variable.
- [x] Create a script that appends a line of text to a text file whenever it is executed.
- [x] Create a script that installs the httpd package, activates httpd, and enables httpd. Finally, your script should print the status of httpd in the terminal.

### Opdracht 2
- [x] Create a script that generates a random number between 1 and 10, stores it in a variable, and then appends the number to a text file.

### Opdracht 3
- [x] Create a script that generates a random number between 1 and 10, stores it in a variable, and then appends the number to a text file only if the number is bigger than 5. If the number is 5 or smaller, it should append a line of text to that same text file instead.

### Gebruikte bronnen
- [How to Add a Directory to PATH in Linux](https://linuxize.com/post/how-to-add-directory-to-path-in-linux/)
- [Bash Scripting Tutorial – Linux Shell Script and Command Line for Beginners](https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners/#how-to-get-started-with-bash-scripting)
- [Package Management Essentials: apt, yum, dnf, pkg](https://www.digitalocean.com/community/tutorials/package-management-basics-apt-yum-dnf-pkg)
- [Generate Random Number in Bash](https://www.delftstack.com/howto/linux/random-number-generation-in-bash/)
- [Bash Scripting: Conditionals](https://linuxconfig.org/bash-scripting-conditionals)

### Ervaren problemen
Onverwacht resultaat bij opdracht 3: random2.sh schreef steeds alle getallen naar random2.txt in plaats van alleen de getallen groter dan 5. Ik kwam er achter dat dit kwam door het gebruik van single brackets in plaats van double brackets, waardoor bash de conditional > aan zag voor file redirection operator. Bron: [Differences Between Single and Double Brackets in Bash](https://www.baeldung.com/linux/bash-single-vs-double-brackets)

### Resultaat

Scripts directory aangemaakt en toegevoegd aan de `$PATH` variable:

![path](../00_includes/week_01_images/screen21.png)

Eerste bash script geschreven en getest. Elke keer dat **append.sh** wordt uitgevoerd komt er een regel bij in **append.txt**:

```
#!/usr/bin/bash
echo "Another line" >> append.txt
```

![append](../00_includes/week_01_images/screen22.png)

Bash script voor het installeren, enablen en starten van apache:

```
#!/usr/bin/bash
sudo apt update
sudo apt install apache2
sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl status apache2
```

Screenshot hieronder laat de installatie niet zien, want die was al eerder gelukt:

![apache2](../00_includes/week_01_images/screen24.png)

Een script die het `shuf` command gebruikt om een willekeurig getal te genereren en vervolgens toe te voegen aan random.txt:

```
#!/usr/bin/bash
random=$(shuf -i 2-9 -n1)
echo $random >> random.txt
```

![random](../00_includes/week_01_images/screen25.png)

Ten slotte een script die het `shuf` command gebruikt om een willekeurig getal te genereren en met een if else statement kijkt of het getal groter is dan 5:

```
#!/usr/bin/bash
random=$(shuf -i 2-9 -n1)
if [[ $random > 5 ]]
then
        echo $random >> random2.txt
else
        echo "Kleiner dan 6" >> random2.txt
fi
```

![random](../00_includes/week_01_images/screen28.png)