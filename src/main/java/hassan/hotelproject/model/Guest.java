package hassan.hotelproject.model;

import lombok.*;
@EqualsAndHashCode(callSuper = true)
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Guest extends Person {
    private int guestId;
    private String notes;
}