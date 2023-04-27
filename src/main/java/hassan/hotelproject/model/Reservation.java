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
public class Reservation {
    private int reservationId;
    private Guest guest;
    private Room room;
    private Payment payment;
    private Date checkInDate;
    private Date checkOutDate;
    private ReservationStatus reservationStatus;
}
