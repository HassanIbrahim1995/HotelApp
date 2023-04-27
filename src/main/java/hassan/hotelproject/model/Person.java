package hassan.hotelproject.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Person {
    private int id;
    private String firstName;
    private String middelName;
    private String lastName;
    private String email;
    private String phone;
    private Address address;
    private Date birthDate;
}