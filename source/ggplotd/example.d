/**
    This module contains the different examples that are shown in the README

    It will only be included in unittest code, but is empty otherwise.
*/
module example;

version (unittest)

import dunit.toolkit;

///
unittest
{
    /// http://blackedder.github.io/ggplotd/images/function.png
    import std.random : uniform;
    import std.typecons : Tuple;
    import ggplotd.stat : statFunction;
    import ggplotd.ggplotd : GGPlotD;
    import ggplotd.geom : geomLine, geomPoint;
    import ggplotd.range : mergeRange;

    auto f = (double x) { return x / (1 + x); };

    auto aes = statFunction(f, 0.0, 10);
    auto gg = GGPlotD().put(geomLine(aes));

    // Generate some noisy points 
    auto f2 = (double x) { return x / (1 + x) * uniform(0.75, 1.25); };
    auto aes2 = f2.statFunction(0.0, 10, 25);

    // Show points in different colour
    auto withColour = Tuple!(string, "colour")("aquamarine").mergeRange(aes2);
    gg = gg.put(withColour.geomPoint);

    gg.save("function.png");
}

///
unittest
{
    /// http://blackedder.github.io/ggplotd/images/hist2D.svg
    import std.array : array;
    import std.algorithm : map;
    import std.range : iota, zip;
    import std.random : uniform;

    import ggplotd.aes : aes;
    import ggplotd.colour : colourGradient;
    import ggplotd.colourspace : XYZ;
    import ggplotd.geom : geomHist2D;
    import ggplotd.ggplotd : GGPlotD, addTo;
    import ggplotd.legend : continuousLegend;

    auto xs = iota(0,500,1).map!((x) => uniform(0.0,5)+uniform(0.0,5))
        .array;
    auto ys = iota(0,500,1).map!((y) => uniform(0.0,5)+uniform(0.0,5))
        .array;
    auto gg = xs.zip(ys)
                .map!((t) => aes!("x","y")(t[0], t[1]))
                .geomHist2D.addTo(GGPlotD());
    // Use a different colour scheme
    gg.put( colourGradient!XYZ( "white-cornflowerBlue-crimson" ) );

    gg.put(continuousLegend);

    gg.save( "hist2D.svg" );
}

///
unittest
{
    /// http://blackedder.github.io/ggplotd/images/filled_density.svg
    import std.array : array;
    import std.algorithm : map;
    import std.range : repeat, iota, chain, zip;
    import std.random : uniform;

    import ggplotd.aes : aes;
    import ggplotd.geom : geomDensity;
    import ggplotd.ggplotd : GGPlotD, addTo;
    import ggplotd.legend : discreteLegend;
    auto xs = iota(0,50,1).map!((x) => uniform(0.0,5)+uniform(0.0,5)).array;
    auto cols = "a".repeat(25).chain("b".repeat(25));
    auto gg = xs.zip(cols, 0.45.repeat(xs.length))
        .map!((a) => aes!("x", "colour", "fill")(a[0], a[1], a[2]))
        .geomDensity
        .addTo(GGPlotD());
    gg = discreteLegend.addTo(gg);
    gg.save( "filled_density.svg" );
}

///
unittest
{
    /// http://blackedder.github.io/ggplotd/images/density2D.png
    import std.algorithm : map;
    import std.range : iota, zip;
    import std.random : uniform;

    import ggplotd.aes : aes;
    import ggplotd.colour : colourGradient;
    import ggplotd.colourspace : XYZ;
    import ggplotd.geom : geomDensity2D;
    import ggplotd.ggplotd : GGPlotD, addTo;
    import ggplotd.legend : continuousLegend;

    auto xs = iota(0,500,1).map!((x) => uniform(0.0,5)+uniform(0.0,5));
    auto ys = iota(0,500,1).map!((y) => uniform(0.5,1.5)+uniform(0.5,1.5));
    auto gg = zip(xs, ys)
        .map!((a) => aes!("x","y")(a[0], a[1]))
        .geomDensity2D
        .addTo( GGPlotD() );
    // Use a different colour scheme
    gg.put( colourGradient!XYZ( "white-cornflowerBlue-crimson" ) );
    gg.put(continuousLegend);

    gg.save( "density2D.png" );
}

///
unittest
{
    /// http://blackedder.github.io/ggplotd/images/labels.png
    import std.algorithm : map;
    import std.range : zip;
    import std.math : PI;

    import ggplotd.aes : aes;
    import ggplotd.geom : geomPoint, geomLabel;
    import ggplotd.ggplotd : GGPlotD;
    import ggplotd.axes : xaxisRange, yaxisRange;
    auto dt = zip( [0.0,1,2,3,4], [4.0,3,2,1,0], 
        ["center", "left", "right", "bottom", "top"],
        [0.0, 0.0, 0.0, 0.0, 0.0],
        ["center", "left", "right", "bottom", "top"])
        .map!((a) => aes!("x", "y", "label", "angle", "justify")
            (a[0], a[1], a[2], a[3], a[4]));

    auto gg = GGPlotD()
        .put(geomPoint( dt ))
        .put(geomLabel(dt))
        .put(xaxisRange(-2,11))
        .put(yaxisRange(-2,11));

    auto dt2 = zip( [1.0,2,3,4,5], [5.0,4,3,2,1], 
        ["center", "left", "right", "bottom", "top"],
        [0.5*PI, 0.5*PI, 0.5*PI, 0.5*PI, 0.5*PI],
        ["center", "left", "right", "bottom", "top"])
        .map!((a) => aes!("x", "y", "label", "angle", "justify")
            (a[0], a[1], a[2], a[3], a[4]));
    gg.put( geomLabel(dt2) ).put(geomPoint(dt2));

    auto dt3 = zip( [1.0,2,4,6,7], [8.0,7,5,3,2], 
        ["center", "left", "right", "bottom", "top"],
        [0.25*PI, 0.25*PI, 0.25*PI, 0.25*PI, 0.25*PI],
        ["center", "left", "right", "bottom", "top"])
        .map!((a) => aes!("x", "y", "label", "angle", "justify")
            (a[0], a[1], a[2], a[3], a[4]));
    gg.put( geomLabel(dt3) ).put(geomPoint(dt3));

    gg.save( "labels.png" );
}

auto runMCMC() {
    import std.algorithm : map;
    import std.array : array;
    import std.math : pow;
    import std.range : iota;
    import dstats.random : rNorm;
    return iota(0,1000).map!((i) {
        auto x = rNorm(1, 0.5);
        auto y = rNorm(pow(x,3), 0.5);
        auto z = rNorm(x + y, 0.5);
        return [x, y, z];
    }).array;
}

///
unittest
{
    // http://blackedder.github.io/ggplotd/images/parameter_distribution.png
    import std.algorithm : map;
    import std.format : format;
    import ggplotd.aes : aes;
    import ggplotd.axes : xaxisLabel, yaxisLabel;
    import ggplotd.geom : geomDensity, geomDensity2D;
    import ggplotd.ggplotd : Facets, GGPlotD, addTo;
    import ggplotd.colour : colourGradient;
    import ggplotd.colourspace : XYZ;

    // Running MCMC for a model that takes 3 parameters
    // Will return 1000 posterior samples for the 3 parameters
    // [[par1, par2, par3], ...]
    auto samples = runMCMC();

    // Facets can be used for multiple subplots
    Facets facets;

    // Cycle over the parameters
    foreach(i; 0..3) 
    {
        foreach(j; 0..3) 
        {
            auto gg = GGPlotD();

            gg = format("Parameter %s", i).xaxisLabel.addTo(gg);
            if (i != j)
            {
                // Change the colourGradient used
                gg = colourGradient!XYZ( "white-cornflowerBlue-crimson" )
                    .addTo(gg);
                gg = format("Parameter %s", j).yaxisLabel.addTo(gg);
                gg = samples.map!((sample) => aes!("x", "y")(sample[i], sample[j]))
                    .geomDensity2D
                    .addTo(gg);
            } else {
                gg = "Density".yaxisLabel.addTo(gg);
                gg = samples.map!((sample) => aes!("x", "y")(sample[i], sample[j]))
                    .geomDensity
                    .addTo(gg);
            }
            facets = gg.addTo(facets);
        }
    }
    facets.save("parameter_distribution.png", 670, 670);
}

///
unittest
{
    // http://blackedder.github.io/ggplotd/images/diamonds.png
    import std.csv : csvReader; import std.file : readText;
    import std.algorithm : map;
    import std.array : array;
    import ggplotd.aes : aes;
    import ggplotd.axes : xaxisLabel, yaxisLabel;
    import ggplotd.ggplotd : GGPlotD, addTo;
    import ggplotd.geom : geomPoint;


    struct Diamond {
        double carat;
        string clarity;
        double price;
    }

    // Read the data
    auto diamonds = readText("test_files/diamonds.csv").csvReader!(Diamond)(
    ["carat","clarity","price"]);

    auto gg = diamonds.map!((diamond) => 
        // Map data to aesthetics (x, y and colour)
        aes!("x", "y", "colour", "size")(diamond.carat, diamond.price, diamond.clarity, 0.8))
    .array
    // Draw points
    .geomPoint.addTo(GGPlotD());

    // Axis labels
    gg = "Carat".xaxisLabel.addTo(gg);
    gg = "Price".yaxisLabel.addTo(gg);
    gg.save("diamonds.png"); 
}

/// Multiple histograms examples
unittest
{
    // http://blackedder.github.io/ggplotd/images/filled_hist.svg
    import std.array : array;
    import std.algorithm : map;
    import std.range : repeat, iota, chain, zip;
    import std.random : uniform;

    import ggplotd.aes : aes;
    import ggplotd.geom : geomHist;
    import ggplotd.ggplotd : addTo, GGPlotD;

    auto xs = iota(0,50,1).map!((x) => uniform(0.0,5)+uniform(0.0,5)).array;
    auto cols = "a".repeat(25).chain("b".repeat(25));
    auto gg = xs.zip(cols)
        .map!((a) => aes!("x", "colour", "fill")(a[0], a[1], 0.45))
        .geomHist
        .addTo(GGPlotD());
    gg.save( "filled_hist.svg" );
}

/// Boxplot example
unittest
{
    // http://blackedder.github.io/ggplotd/images/boxplot.svg
    import std.array : array;
    import std.algorithm : map;
    import std.range : repeat, iota, chain, zip;
    import std.random : uniform;

    import ggplotd.aes : aes;
    import ggplotd.geom : geomBox;
    import ggplotd.ggplotd : GGPlotD, addTo;

    auto xs = iota(0,50,1).map!((x) => uniform(0.0,5)+uniform(0.0,5));
    auto cols = "a".repeat(25).chain("b".repeat(25));
    auto gg = xs.zip(cols)
        .map!((a) => aes!("x", "colour", "fill", "label" )(a[0], a[1], 0.45, a[1]))
        .geomBox
        .addTo(GGPlotD());
    gg.save( "boxplot.svg" );
}

/// Changing axes details
unittest
{
    // http://blackedder.github.io/ggplotd/images/axes.svg
    import std.array : array;
    import std.math : sqrt;
    import std.algorithm : map;
    import std.range : iota;

    import ggplotd.aes : aes;
    import ggplotd.axes : xaxisLabel, yaxisLabel, xaxisOffset, yaxisOffset, xaxisRange, yaxisRange;
    import ggplotd.geom : geomLine;
    import ggplotd.ggplotd : GGPlotD, addTo, Margins, title;
    import ggplotd.stat : statFunction;

    auto f = (double x) { return x/(1+x); };
    auto gg = statFunction(f, 0, 10.0)
        .geomLine
        .addTo(GGPlotD());

    // Setting range and label for xaxis
    gg.put( xaxisRange( 0, 8 ) ).put( xaxisLabel( "My xlabel" ) );
    // Setting range and label for yaxis
    gg.put( yaxisRange( 0, 2.0 ) ).put( yaxisLabel( "My ylabel" ) );

    // change offset
    gg.put( xaxisOffset( 0.25 ) ).put( yaxisOffset( 0.5 ) );

    // Change Margins 
    gg.put( Margins( 60, 60, 40, 30 ) );

    // Set a title
    gg.put( title( "And now for something completely different" ) );

    // Saving on a 500x300 pixel surface
    gg.save( "axes.svg", 500, 300 );
}
