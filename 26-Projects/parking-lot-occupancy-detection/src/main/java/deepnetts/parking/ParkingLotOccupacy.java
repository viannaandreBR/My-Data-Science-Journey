package deepnetts.parking;

import deepnetts.core.DeepNetts;
import deepnetts.data.ImageSet;
import deepnetts.eval.ClassifierEvaluator;
import deepnetts.net.ConvolutionalNetwork;
import deepnetts.net.layers.activation.ActivationType;
import deepnetts.net.loss.LossType;
import deepnetts.net.train.BackpropagationTrainer;
import deepnetts.util.DeepNettsException;
import deepnetts.util.FileIO;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.visrec.ml.eval.EvaluationMetrics;

public class ParkingLotOccupacy {

    int imageWidth = 96;
    int imageHeight = 96;

    String trainingFile = "D:/datasets/Parkiranje/A/index.txt";
    String labelsFile = "D:/datasets/Parkiranje/A/labels.txt";

    static final Logger LOG = Logger.getLogger(DeepNetts.class.getName());


    public void run() throws DeepNettsException, IOException {

        ImageSet imageSet = new ImageSet(imageWidth, imageHeight);
        LOG.info("Loading images...");
        imageSet.loadLabels(new File(labelsFile));
        imageSet.loadImages(new File(trainingFile));
        ImageSet[] imageSets = imageSet.split(0.60, 0.40);

        // create convolutional neural network
        LOG.info("Creating neural network...");
        ConvolutionalNetwork legoPeopleNet = ConvolutionalNetwork.builder()
                                            .addInputLayer(imageWidth, imageHeight, 3)
                                            .addConvolutionalLayer(6, 3, 3, ActivationType.TANH)
                                            .addMaxPoolingLayer(2,2,2)
                                            .addFullyConnectedLayer(30, ActivationType.TANH)
                                            .addFullyConnectedLayer(10, ActivationType.TANH)
                                            .addOutputLayer(1, ActivationType.SIGMOID)
                                            .lossFunction(LossType.CROSS_ENTROPY)
                                            .randomSeed(123)
                                            .build();
        
        // train convolutional network
        LOG.info("Training neural network...");
        BackpropagationTrainer trainer = legoPeopleNet.getTrainer();
        trainer.setLearningRate(0.01f);
        trainer.setMaxError(0.05f);
        trainer.setMaxEpochs(15);
        trainer.train(imageSets[0]);
        LOG.info("Done training neural network.");

        ClassifierEvaluator evaluator = new ClassifierEvaluator();
        EvaluationMetrics  pm =  evaluator.evaluate(legoPeopleNet, imageSets[1]);
        System.out.println(pm);        
        
        // save trained network to file
        try {
            FileIO.writeToFile(legoPeopleNet, "legoPeople.net");
        } catch (IOException ex) {
            Logger.getLogger(ParkingLotOccupacy.class.getName()).log(Level.SEVERE, null, ex);
        }


    }




    public static void main(String[] args) {
        try {
            (new ParkingLotOccupacy()).run();
        } catch (DeepNettsException | IOException ex) {
            Logger.getLogger(ParkingLotOccupacy.class.getName()).log(Level.SEVERE, null, ex);
        }


    }
}