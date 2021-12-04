package com.capstone.controller;

import java.util.HashSet;
import java.util.Set;
class a{
	private void solvee() {
		System.out.println("a");
	}
}
public class random {
	public static void reverse(int[] a) {
		if(a==null || a.length<2)
			return;
		for(int i=0 ; i<a.length/2 ; i++) {
			int t = a[i];
			a[i] = a[a.length-1-i];
			a[a.length-1-i] = t;
		}
	}
	
	public static void bubleSort(int[] a) {
		boolean sw;
		for(int i=0 ; i<a.length-1 ; i++) {
			sw=false;
			for(int j=0 ; j<a.length-1-i ; j++) {
				if(a[j] > a[j+1]) {
					
					int t = a[j+1];
					a[j+1] = a[j];
					a[j] = t;
					sw = true;
				}
			}
			if(sw == false) {
				break;
			}
		}
	}
	public static void selectionSort(int a[]) {
		for(int i=0 ; i<a.length ; i++) {
			int max = i;
			for(int j=i+1 ; j<a.length ; j++) {
				if(a[j]<a[max]) {
					max = j;
				}
			}
			if(max!=i) {
				int t = a[max];
				a[max] = a[i];
				a[i] = t;
			}
		}
	}
	public static void insertSort(int []a) {
		for(int i=1 ; i<a.length ; i++) {
			int key = a[i];
			int j=i-1;
			while(j>=0 && a[j]>key) {
				a[j+1] = a[j];
				j--;
			}
			a[j+1]=key;
		}
	}
	public static int binarySearch(int l, int r, int x, int a[]) {
		if(r>=l) {
			int m = l+ (r-l)/2;
			if(a[m] == x)
				return m;
			else if(a[m]<x)
				return binarySearch(m+1, r, x, a);
			else 
				return binarySearch(l, m-1, x, a);
		}
		else {
			return -1;
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	/*	int n = 534543;
		int s =0;
		while(n>0) {
			int a = n%10;
			s = s * 10 + a;		
			n/=10;
		}
		
		int[] a = {1,8,5,4,7,6};
	//	reverse(a);
	//	bubleSort(a);
	//	selectionSort(a);
		insertSort(a);
		for (int i : a) {
			System.out.print(i + " ");
		}
		System.out.println("\n" + binarySearch(0, a.length-1, 6, a));
		*/
		Set<Integer> integers = new HashSet<Integer>();
		integers.add(1);
		integers.add(2);
		integers.add(2);
		integers.add(1);
		for (Integer integer : integers) {
			System.out.println(integer);
		}
	}

}
