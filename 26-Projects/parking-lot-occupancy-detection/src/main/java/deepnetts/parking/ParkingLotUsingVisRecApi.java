package deepnetts.parking;


import javax.imageio.ImageIO;
import javax.visrec.ml.ClassificationException;
import javax.visrec.ml.ClassifierCreationException;
import javax.visrec.ml.classification.ImageClassifier;
import javax.visrec.ml.classification.NeuralNetImageClassifier;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Map;

/**
 * Hand written digit recognition using MNIST data set - image classification hello world.
 *
 * @author Zoran Sevarac <zoran.sevarac@deepnetts.com>
 */
public class ParkingLotUsingVisRecApi {

    public static void main(String[] args) throws IOException, ClassifierCreationException, ClassificationException {
        int imageWidth = 96;
        int imageHeight = 96;

        String trainingFile = "D:/datasets/Parkiranje/A/index.txt";
        String labelsFile = "D:/datasets/Parkiranje/A/labels.txt";

        // Configure and train the model
        ImageClassifier<BufferedImage> classifier = NeuralNetImageClassifier.builder()
                                                        .inputClass(BufferedImage.class)
                                                        .imageHeight(imageHeight)
                                                        .imageWidth(imageWidth)
                                                        .labelsFile(new File(labelsFile))
                                                        .trainingFile(new File(trainingFile))
                                                        .networkArchitecture(new File("mnist1.json"))
                                                        .exportModel(Paths.get("mnist.dnet"))
                                                        .maxError(0.09f)
                                                        .maxEpochs(1000)
                                                        .learningRate(0.01f)
                                                        .build();
        
        BufferedImage image = ImageIO.read(new File("00060.png"));
        Map<String, Float> results = classifier.classify(image);

        // Print the outcome
        System.out.println(results);
    }
}
