package hassan.hotelproject.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Payment {
    private int paymentId;
    private String paymentMethod;
    private double amountPaid;
    private double deposit;
}
