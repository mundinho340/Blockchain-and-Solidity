//Mapping Retrieval

//Compared to arrays retrieving a value from a mapping is quite simple!

//Consider:

mapping(address => bool) students;

function isStudent(address addr) external view returns(bool){
    return students[addr];
}
//Versus:
address[] students;

function isStudent(address addr) external view returns(bool) {
    for(uint i = 0; i < students.length; i++) {
        if(students[i] === addr) {
            return true;
        }
    }
    return false;
}
