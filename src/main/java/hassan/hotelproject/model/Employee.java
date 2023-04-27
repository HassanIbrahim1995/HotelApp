package hassan.hotelproject.model;

import lombok.*;

import java.util.Date;

@EqualsAndHashCode(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Employee extends Person {
    private int employeeId;
    private String position;
    private double salary;
    private Date hireDate;
    private Department department;
    private User loginDetails;
}
