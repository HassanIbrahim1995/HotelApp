package hassan.hotelproject.service;

import hassan.hotelproject.model.Person;
import hassan.hotelproject.repository.PersonRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class PersonService {
    private PersonRepository personRepository;
    public Person savePerson(Person person) {
        return personRepository.save(person);
    }
    public Person getPersonById(int id) {
        return personRepository.findById(id).orElseThrow(null);
    }
}
