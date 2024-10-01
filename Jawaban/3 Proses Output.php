<?php
class Data {
    private $name;
    private $age;

    function __construct($name, $age) {
        $this->name = $name;
        $this->age = $age;
    }

    function getName() {
        return $this->name;
    }

    function isAdult() {
        return $this->age >= 18 ? "an Adult" : "Not an Adult";
    }
}

// Membuat objek dari kelas Data
$person1 = new Data("Calvin", 16);
$person2 = new Data("Chris", 20);

// Menghasilkan output
echo "Hello, " . $person1->getName() . "! You are " . $person1->isAdult() . "\n";
echo "Hello, " . $person2->getName() . "! You are " . $person2->isAdult() . "\n";
?>

