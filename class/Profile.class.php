<?php
class Profile {
    private int $_id;
    private int $_userID;
    private string $_firstName;
    private string $_lastName;
    private int $_profilePhotoID;

    public function __construct(int $id, int $userID, string $firstName, string $lastName, int $profilePhotoID)
    {
        $this->_id = $id;
        $this->_userID = $userID;
        $this->_firstName = $firstName;
        $this->_lastName = $lastName;
        $this->_profilePhotoID = $profilePhotoID;
    }

    static function Get($id) : Profile {
        //pobierz jeden profil po jego ID
        //zwróć obiekt Profile
        //połączenie do bazy danych
        $db = new mysqli('localhost', 'root', '', 'facebook');
        //kwerenda do bazy danych
        $sql = "SELECT * FROM profile WHERE ID=? LIMIT 1";
        $q = $db->prepare($sql);
        $q->bind_param("i", $id);
        $q->execute();
        $result = $q->get_result();
        $row = $result->fetch_assoc();
        $p = new Profile($row['id'], $row['userid'], $row['FirstName'], $row['LastName'], $row['profilePhotoD']);
        return $p;
    }
    static function GetAll() : array {
        //pobierz wszystkie profile
        //zwróć tablicę obiektów Profile
        $db = new mysqli('localhost', 'root', '', 'facebook');
        //kwerenda do bazy danych
        $sql = "SELECT * FROM profile LIMIT 500";
        $q = $db->prepare($sql);
        $q->execute();
        $result = $q->get_result();
        $profiles = array();
        while($row = $result->fetch_assoc()){
            $profiles[] = new Profile($row['id'], $row['userid'], $row['FirstName'], $row['LastName'], $row['profilePhotoD']);
        }
        return $profiles;
    }
    static function GetUserProfile($userID) : Profile {
        //pobierz profil użytkownika
        //zwróć obiekt Profile
        $db = new mysqli('localhost', 'root', '', 'facebook');
        //kwerenda do bazy danych
        $sql = "SELECT * FROM profile WHERE userid=? LIMIT 1";
        $q = $db->prepare($sql);
        $q->bind_param("i", $userID);
        $q->execute();
        $result = $q->get_result();
        $row = $result->fetch_assoc();
        $p = new Profile($row['id'], $row['userid'], $row['FirstName'], $row['LastName'], $row['profilePhotoD']);
        return $p;
    }
    function getFullName() : string {
        return $this->_firstName . ' ' . $this->_lastName;
    }
    function getProfileID() : string {
        return $this->_profilePhotoID;
    }
    function getProfilePhotoURL($profileID) : string {
        //TODO: znajdz i wyswietl zdjecie z bazy
        $db = new mysqli('localhost', 'root', '', 'facebook');
        $sql = "SELECT * FROM photo WHERE profileid=? LIMIT 1";
        $q = $db->prepare($sql);
        $q->bind_param("i", $profileID);
        $q->execute();
        $result = $q->get_result();
        $row = $result->fetch_assoc();
        //$p = $result['url'];
        //fallback
        
        return $row['url'];
    }
}

?>