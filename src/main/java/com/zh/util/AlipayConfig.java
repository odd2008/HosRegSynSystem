package com.zh.util;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016091900547337";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDbrPNKu/rqCvGU8kCa04kX/BWuSFrQRJ+3pNsu2cr4A5yfxQcPpMoKfKHCcAwRD6uMN7ds7DeP+kr/Arvql2uziMeRSmNny296imXMqVMCt+vhAbxTNgFti2J9wUUrXYqc0EuE5ATAtXTzAy3OlS9EjVozFRxnOXcjPxN9IQXlDrJpI182uMl/BAjSXK5u4w3p+RfXmoCZx0TvpvBeoq4G9vgfEgZkSs8P4vzC24pYOcVdbtxWKo1oirSH1WYMUPeImvgbINDRNf8vE4/gUR+5/g7T2Sh/TvUwLveI4nuaZZeZy9Opg7Rrs/rFVy/qYsyFt2nLyDrZUoetNFEjhIxDAgMBAAECggEAUmyMRMhPly1QA8D5uJ4SXGt7fw8q8+Yrv24dx3B0laZVSCVXRulf3Ztx3lDIVkZ46X2mVzoyhtU0+oX+GEGEabKynrM4pSNRyrrPA4Gs4eI8oQpTrS0gUAfyhpjT6TeJ4NjO3SfpGJ19KglRUKftOl2HMI+FPr3zE8iA+XxAh/bPrQi4UYwQAsjeD/6qwtiHRYUeJs0BqG728W7qXzxf80R88ombw/zl057EN0Zrvs4h9q0/l5sJIV5XMD2MH9rp6tYaC0u5RUcmEPnebhl7wAR4qMdkFF+dQiqp6RP+gksA4QhjydrOdcYG6Gh7pbtuSZpfniocB8SFDF52S/pAAQKBgQD1lkBod1trH5YNbJvByom513UDuYsQF6ayJ2XjcVppSkfN6lcaMY5YjYT4BIi8diMdhSKlnYGR3dRtChB1OoVDmVoqo5ReMYuYSh0XX/4vKfk4kdJp6tYCU/hdo89z0E57VHW2/UwhCQ92VTUblZSbs4EeGfqxPJUufGlRCxZ8QwKBgQDk/XEJFqT1HIVluUghk0MMV4OlDnlKg9P/nKfJIW6r+T/UiSfLgz7z+VsVm8DQc8cRZr7f8wl2LRVYJHVWH0hNCZeTzDtiRLaMNIW1Mjk6C/eBEHMsemg7nNq3FtaxsIwivvZTHkqvwkqaZm/I2efnr3REvAzFNGBvOzV0IQCwAQKBgQCyvhfEsNJtpkCdJqY6psIU67bz7hBDtyMRWVFz96V5KqIWQfABVX4n/2B+7zXiDQ3Dx4mPBpMuakjYz9FosR4bNDsG+6XZ5K+YOKDxyWEETMViIegGRPBcI2eKJ9aukTb91lwSwkqtZJ3HX37Ww8i0hjJ8iSYH53MgsVYpsSs9ZwKBgQCFW5Az4cspsHWDu3bljtSyYFkbjCVZHxMcvwf8G4tPfjYNOd9CJ2pHPcYs/Gs7OuIJIVQyKmEtQK44iesHv+oka1yqR3uiDDBf0Mq5rskjJAr9UC4zDgqcBQpfLF7WVuIV7i6YU4DdgQJfjx600yq6hDTrPrUVOB6dSNcljX7QAQKBgQClgw0VH8D9IIak+cdfaFW6YFcMEw9L9QKfZ/qZRBIugewkq6LDMFARGcW7f5ooCN2q+PLch32aTla56KDJavNFP8k8fAqLWvzzZzernEpQzUgKnh+9yMZoHD/3CfiX3wYxpsYz7QdxwWIWeN9FLSbEch8JrasZwwf47C+OfoTcow==";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvq28dJZl30xUfsv8zzBmt9RuD3Tb1GnuBes6fmJMsrP72NOS5xwBxu7TRZ3gIZu7c01sff0n1i9xqnwdJxSVqJoiSOc8f9eFpHYtIDqZFOs2DX42O3724iefy4gdkgkA5OAz93BD9hMMm+AJVGUHo0wwGwF2K/1U26TSkmxSfESIFLf4sAmHOF9/xylx1YxUAXirLLoxW4JYCdBcCt0MqFB3YRaYBNfUe0BSJ1N7UT+7lqufECzLI6q48qtvZWrfn1k2AsXF1SOg9g1gzPdTB/wfy3IlNBiOUA+pMj+syCluXxljm1J0HI/prKq1kI05py1gNjwp2pgr2OC4Lyfh+QIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/HosRegSynSystem/user/aliPaySuccessful.do";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

