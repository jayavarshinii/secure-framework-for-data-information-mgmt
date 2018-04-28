/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.grid.Servlets;

import java.io.File;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URI;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Random;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hdfs.DFSClient.DFSInputStream;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;
import com.mongodb.WriteResult;

import net.aksingh.owmjapis.DailyForecast;
import net.aksingh.owmjapis.OpenWeatherMap;

/**
 *
 * @author Jesu Jeni
 */
public class NewClass {
public static String getCityCode(String Location)
{
     String cityName="",cityCode="";
    System.out.println(Location);
    try
    {
        OpenWeatherMap owm = new OpenWeatherMap("954c3bfd67c0812c418acc5aa6263bad");
            DailyForecast df = owm.dailyForecastByCityName(Location, Byte.parseByte("10"));


            if (!df.isValid()) {
                System.out.println("Reponse is inValid!");
            } else {
                System.out.println("Reponse is Valid!");
                System.out.println();



                if (df.hasCityInstance()) {
                    DailyForecast.City city = df.getCityInstance();
                    if (city.hasCityName()) {
                        if (city.hasCityCode()) {
                            cityCode =""+ city.getCityCode();
                            System.out.println("City code: " + city.getCityCode());
                        }
                        if (city.hasCityName()) {
                            cityName=city.getCityName();
                            System.out.println("City name: " + city.getCityName());
                        }
                        System.out.println();
                    }
                }

            
    }
    }
    catch(Exception ex)
    {
        ex.printStackTrace();
    }
    return cityCode;
}
    
    public static ArrayList<ArrayList> getWeather(String Location) {
        ArrayList<ArrayList> arr = new ArrayList<ArrayList>();
        System.out.println("Check Here==>"+Location);
        String cityName="",cityCode="";
        try {
            OpenWeatherMap owm = new OpenWeatherMap("954c3bfd67c0812c418acc5aa6263bad");
            DailyForecast df = owm.dailyForecastByCityName(Location, Byte.parseByte("10"));


            if (!df.isValid()) {
                System.out.println("Reponse is inValid!");
            } else {
                System.out.println("Reponse is Valid!");
                System.out.println();



                if (df.hasCityInstance()) {
                    DailyForecast.City city = df.getCityInstance();
                    if (city.hasCityName()) {
                        if (city.hasCityCode()) {
                            cityCode =""+ city.getCityCode();
                            System.out.println("City code: " + city.getCityCode());
                        }
                        if (city.hasCityName()) {
                            cityName=city.getCityName();
                            System.out.println("City name: " + city.getCityName());
                        }
                        System.out.println();
                    }
                }

                System.out.println("Total forecast instances: " + df.getForecastCount());
                System.out.println();




                for (int i = 0; i < df.getForecastCount(); i++) {
                    DailyForecast.Forecast forecast = df.getForecastInstance(i);

                    // System.out.println("*** Forecast instance number " + (i+1) + " ***");

                    if (forecast.hasDateTime()) {
                        ArrayList ar = new ArrayList();

                        /*System.out.println("Date Time="+forecast.getDateTime());
                         System.out.println("Humidity="+forecast.getHumidity());
                         System.out.println("Clopuds="+forecast.getPercentageOfClouds());
                         System.out.println("Pressure="+forecast.getPressure());
                         System.out.println("Rain="+forecast.getRain());
                         System.out.println("Snow="+forecast.getSnow());
                         System.out.println("Wind Degree="+forecast.getWindDegree());
                         System.out.println("Wind Speed="+forecast.getWindSpeed());
                         System.out.println("ResCode="+forecast.getResponseCode());
                         DailyForecast.Forecast.Temperature  Tempe = forecast.getTemperatureInstance();
                         System.out.println("Day Temp="+Tempe.getDayTemperature());
                         System.out.println("Eve Temp="+Tempe.getEveningTemperature());
                         System.out.println("Max Temp="+Tempe.getMaximumTemperature());
                         System.out.println("Min Temp="+Tempe.getMinimumTemperature());
                         System.out.println("Morn Temp="+Tempe.getMorningTemperature());
                         System.out.println("Night Temp="+Tempe.getNightTemperature());
                         */
                        
                        ar.add(forecast.getDateTime());
                        ar.add(forecast.getHumidity());
                        ar.add(forecast.getPercentageOfClouds());
                        ar.add(forecast.getPressure());
                        ar.add(forecast.getRain());
                        ar.add(forecast.getSnow());
                        ar.add(forecast.getWindDegree());
                        ar.add(forecast.getWindSpeed());
                       // ar.add(forecast.getResponseCode());
                        DailyForecast.Forecast.Temperature Tempe = forecast.getTemperatureInstance();
                         ar.add(Tempe.getMorningTemperature());
                        ar.add(Tempe.getDayTemperature());
                        ar.add(Tempe.getEveningTemperature());
                        ar.add(Tempe.getNightTemperature());                       
                        ar.add(Tempe.getMinimumTemperature());
                        ar.add(Tempe.getMaximumTemperature());
                        
                        arr.add(ar);
                    }

                    System.out.println(arr);
                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        insertIntoMongoDB(Location, arr, cityCode, cityName);
       
        return arr;
    }
    public static void insertIntoMongoDB(String Location, ArrayList ar, String cityCode, String cityName )
    {
    	BasicDBObject dbo= null;
    	try
    	{
    		Mongo mongo = null;
    		DB db = null;
    		DBCollection coll = null;
    		
    	   mongo = new Mongo("localhost",27017);
      	   db = mongo.getDB("WeatherPrediction1");
      	   coll = db.getCollection("weatherdeatils");
      	   coll.drop();
      	   Iterator<ArrayList>  it = ar.listIterator(); 
      	   while(it.hasNext())
      	   {
      		
      	    ArrayList weather = (ArrayList<String>) it.next();
      	   Date datetime =null;
      	    
      	   dbo =new BasicDBObject();
      	   dbo.append("Location", Location);
      	   dbo.append("cityCode", cityCode);
      	   dbo.append("cityName", cityName);
      	   
      	   //DateFormat sdf = new  SimpleDateFormat("dd/MM/yyyy");
      	   //datetime = sdf.parse((String)weather.get(0));
      	 dbo.append("date", weather.get(0));  
      	 //dbo.append("date", "10-12-91");
      	   dbo.append("Humidity", weather.get(1));
      	  dbo.append("Clouds",weather.get(2));
      	  dbo.append("Pressure",weather.get(3));
      	  dbo.append("Rain",weather.get(4));
      	  dbo.append("Snow", weather.get(5));
      	  dbo.append("Wind_Degree",weather.get(6));
      	  dbo.append("Wind_Speed",weather.get(7));
      	  dbo.append("ResCode",weather.get(8));          
      	  dbo.append("Day_Temp",weather.get(9));
      	  dbo.append("Eve_Temp",weather.get(10));
      	  dbo.append("Max_Temp",weather.get(11));
      	  dbo.append("Min_Temp",weather.get(12));
      	  dbo.append("Morn_Temp",weather.get(13));
      	  //dbo.append("Night_Temp",weather.get(14));
          
      	   
      	   
      	   WriteResult wr= coll.insert(dbo);
      	   int res= wr.getN();
      	   System.out.println("res=="+res);
      	   
      	   }
    		
    	}
    	catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	 InsertHDFS(dbo.toString(), Location);
    	
    }
    public static void InsertHDFS(String Content, String Location)
    {
    	
    	String fileName = Location+"_x";
    	Random random = new Random();
    	fileName += random.nextInt(Integer.MAX_VALUE)+1;
    	
    	
    	try {
    		FileWriter writer = new FileWriter("/tmp/"+fileName);
    		String x="/tmp/"+fileName;
    		System.out.println(x);
    		writer.write(Content);
    		writer.close();
			Configuration conf = new Configuration();
			conf.addResource(new Path("/usr/local/hadoop/conf/core-site.xml"));
			conf.addResource(new Path("/usr/local/hadoop/conf/hdfs-site.xml"));
			FileSystem filesystem = FileSystem.get(conf);
			
			long filesize= fileName.length();
			int pos = fileName.lastIndexOf("/");
			String fname = fileName.substring(pos + 1, fileName.length());
			
			String paname = "hdfs://localhost:54310/tmp/xyz/" +fname;	
    		
			URI uri = new URI(paname);
			Path dest = new Path(uri);
			Path path = new Path("/tmp/"+fileName.toString());
			filesystem.copyFromLocalFile(path, dest);
			filesystem.close();
			System.out.println("Inserted into HDFS!!!");
			

    		Mongo mongo = null;
    		DB db = null;
    		DBCollection coll = null;
    		
    	   mongo = new Mongo("localhost",27017);
      	   db = mongo.getDB("WeatherPrediction");
      	   coll = db.getCollection("FileDetails");
			
      	   BasicDBObject dbo= new BasicDBObject();
      	   dbo.append("FileName", fileName);
      	   coll.insert(dbo);
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
    }
    public static void main(String args[])
    {
    	//InsertHDFS("Hi Jesu", "chennai");

    	
    }
}
