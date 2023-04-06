package com.dworker.xwwechat.util;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

import com.xwqp88.util.DateUtil;

public final class NumberUtil {
	private static NumberFormat numberFormat;

	static {
		numberFormat = NumberFormat.getCurrencyInstance(Locale.CHINA);
		numberFormat.setMinimumFractionDigits(2);
		numberFormat.setMaximumFractionDigits(2);

		numberFormat2 = new DecimalFormat();
	}

	public static String parseForRMB(double number) {
		return numberFormat.format(number);
	}

	private static NumberFormat numberFormat2;

	public static String parseForFloat(double number, int integerDigits,
			int fractionDigits) {
		numberFormat2.setMaximumFractionDigits(fractionDigits);
		numberFormat2.setMinimumFractionDigits(fractionDigits);
		numberFormat2.setMaximumIntegerDigits(integerDigits);
		numberFormat2.setMinimumIntegerDigits(integerDigits);

		return numberFormat2.format(number);
	}

	public static String parseForFloat(double number, int fractionDigits) {
		return parseForFloat(number, 0, fractionDigits);

	}

	public static String randomHex(int num) {
		if (num > 0) {
			/*
			 * StringBuffer buffer = new StringBuffer(); int ri = 0; for (int i
			 * = 0; i < num; i++) { ri = (int)(Math.random() * 16.0);
			 * buffer.append(Integer.toHexString(ri)); }
			 */
			return randomChar(num);
		}
		return null;
	}

	private static char[] RANDOM_CHAR_POOL = { '0', '1', '2', '3', '4', '5',
			'6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
			'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
			'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
			'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
			'W', 'X', 'Y', 'Z', '_', '-' };

	public static String randomChar(int num) {
		StringBuffer buffer = new StringBuffer();
		int length = RANDOM_CHAR_POOL.length;
		Random random = new Random();
		for (int i = 0; i < num; i++) {
			buffer.append(RANDOM_CHAR_POOL[random.nextInt(length)]);
		}
		return buffer.toString();
	}

	public static String genTradeId() {
		return DateUtil.format(new Date(), "yyyyMMddhhmmssms").substring(0, 15);
	}

}
