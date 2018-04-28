/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.grid.Servlets;

/**
 *
 * @author Jehovah
 */
import java.awt.Color;
import java.sql.ResultSet;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.data.xy.XYDataset;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;
import org.jfree.ui.ApplicationFrame;
import org.jfree.ui.RefineryUtilities;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;

/**
 * A simple demonstration application showing how to create a line chart using
 * data from an {@link XYDataset}.
 *
 */
public class MDMRE extends ApplicationFrame {

	String Location=null;
	String date=null;
    /**
     * Creates a new demo.
     *
     * @param title the frame title.
     */
    public MDMRE(final String title,String Location,String date) {

        super(title);

        final XYDataset dataset = createDataset();
        final JFreeChart chart = createChart(dataset);
        final ChartPanel chartPanel = new ChartPanel(chart);
        chartPanel.setPreferredSize(new java.awt.Dimension(500, 270));
        setContentPane(chartPanel);

    }

    /**
     * Creates a sample dataset.
     *
     * @return a sample dataset.
     */
    private XYDataset createDataset() {
    	 
    	 final XYSeries Humidity = new XYSeries("Humidity");
    	 final XYSeries Rain = new XYSeries("Rain");
    	 final XYSeries windspeed = new XYSeries("windspeed");
    	 final XYSeries Temprature = new XYSeries("Temprature");
        
        try
        {
    	 Mongo mongo = null;
 		DB db = null;
 		DBCollection coll = null;
 		
 	   mongo = new Mongo("localhost",27017);
   	   db = mongo.getDB("WeatherPrediction");
   	   coll = db.getCollection("WeatherDeatils");
   	   
   	   BasicDBObject 	dbo =new BasicDBObject();
	   dbo.append("Location", Location);
	   dbo.append("date", date);   
       double rowcount = 0;
       DBCursor cursor = coll.find(dbo);
       while(cursor.hasNext())
       {
    	   rowcount++;
    	   DBObject obj = cursor.next();
    	   //Humidity.add(rowcount, Double.parseDouble((String) obj.get("Humidity")));
    	   //Rain.add(rowcount, Double.parseDouble((String)obj.get("Rain")));
    	   //windspeed.add(rowcount, Double.parseDouble((String)obj.get("windspeed")));
    	   //Temprature.add(rowcount, Double.parseDouble((String)obj.get("Temprature")));
    	   Humidity.add(0, 10);
    	   Rain.add(0, 12);
    	   windspeed.add(0, 15);
    	   Temprature.add(0, 20);
       }
        
        }
        catch(Exception ex)
        {
        	ex.printStackTrace();
        }



        final XYSeriesCollection dataset = new XYSeriesCollection();
        dataset.addSeries(Humidity);
        dataset.addSeries(Rain);
        dataset.addSeries(windspeed);
        dataset.addSeries(Temprature);

        return dataset;

    }

    /**
     * Creates a chart.
     *
     * @param dataset the data for the chart.
     *
     * @return a chart.
     */
    private JFreeChart createChart(final XYDataset dataset) {

        // create the chart...
        final JFreeChart chart = ChartFactory.createXYLineChart(
                "MDMRE", // chart title
                "X", // x axis label
                "Y", // y axis label
                dataset, // data
                PlotOrientation.HORIZONTAL,
                true, // include legend
                true, // tooltips
                false // urls
                );

        // NOW DO SOME OPTIONAL CUSTOMISATION OF THE CHART...
        chart.setBackgroundPaint(Color.white);

//        final StandardLegend legend = (StandardLegend) chart.getLegend();
        //      legend.setDisplaySeriesShapes(true);

        // get a reference to the plot for further customisation...
        final XYPlot plot = chart.getXYPlot();
        plot.setBackgroundPaint(Color.lightGray);
        //    plot.setAxisOffset(new Spacer(Spacer.ABSOLUTE, 5.0, 5.0, 5.0, 5.0));
        plot.setDomainGridlinePaint(Color.white);
        plot.setRangeGridlinePaint(Color.white);

        final XYLineAndShapeRenderer renderer = new XYLineAndShapeRenderer();
        renderer.setSeriesLinesVisible(0, false);
        renderer.setSeriesShapesVisible(1, false);
        plot.setRenderer(renderer);

        // change the auto tick unit selection to integer units only...
        final NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
        rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
        // OPTIONAL CUSTOMISATION COMPLETED.

        return chart;

    }

    // ****************************************************************************
    // * JFREECHART DEVELOPER GUIDE                                               *
    // * The JFreeChart Developer Guide, written by David Gilbert, is available   *
    // * to purchase from Object Refinery Limited:                                *
    // *                                                                          *
    // * http://www.object-refinery.com/jfreechart/guide.html                     *
    // *                                                                          *
    // * Sales are used to provide funding for the JFreeChart project - please    * 
    // * support us so that we can continue developing free software.             *
    // ****************************************************************************
    /**
     * Starting point for the demonstration application.
     *
     * @param args ignored.
     *//*
    public static void main(final String[] args) {

        final MDMRE demo = new MDMRE("Weather Report");
        demo.pack();
        RefineryUtilities.centerFrameOnScreen(demo);
        demo.setVisible(true);

    }*/
}