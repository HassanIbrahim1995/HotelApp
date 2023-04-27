package hassan.hotelproject.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Address {
    private int id;
    private String streetName;
    private String houseNumber;
    private String zipCode;
    private String city;
    private String country;
}