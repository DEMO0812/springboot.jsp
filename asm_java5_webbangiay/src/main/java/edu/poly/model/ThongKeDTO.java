package edu.poly.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ThongKeDTO implements Serializable{

	private int totalOrders;
	private double totalMoney;
	private int totalQuantity;
	private int totalUniqueCustomers;
}
