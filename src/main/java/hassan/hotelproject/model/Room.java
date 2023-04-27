package hassan.hotelproject.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Room {
    private int roomNumber;
    private RoomType roomType;
    private int capacity;
    private double pricePerNight;
    private String description;
    private BedType bedType;
}
