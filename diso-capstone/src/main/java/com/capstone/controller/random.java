package com.capstone.controller;

import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

public class random {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for (int i = 0; i < 5; i++) {
			Random random = new Random();
			int a = ThreadLocalRandom.current().nextInt(1000, 9999);
			System.out.println(a);
		}
	}

}
