# MATLAB implementation of basic concepts of Digital Communications

### By Soroosh Tayebi Arasteh

This project contains programming experiments of the 
**Praktikum Digitale Übertragung (Digital Communications Labratory)** course (SS19) offered
 by the [Institute for the Digital Communications (idc)](https://www.idc.tf.fau.de/) 
of the [Electrical Engineering Department](https://www.eei.tf.fau.de/) at [University of Erlangen-Nuremberg (FAU)](https://www.fau.de/).

## Intorduction

Today, digital transmission techniques are widely used in many common applications, e.g. mobile
telephony, digital video broadcasting etc. Some of the advantages of digital transmission
techniques over analog schemes like amplitude modulation and frequency modulation are
a much better power efficiency and a tremendous flexibility.

In this repository, some basic implementations of digital transmission techniques are provided. 
The script *./FAU_DiCoLabScript_2018* will be the framework of
the experiments, which contains all the details corresponding to each experiment.

## Overview of the files

- **Transmitter and Receiver**: In this experiment, a complete digital communication system is implemented, where
the whole system shall work on one computer using Matlab without any additional
hardware components.
the Matlab functions for transmitter, channel and receiver are be implemented.
To evaluate the performance of the simulation setup, in
addition, a function calculating the bit error rate (BER) is implemented.
For more details on individual task desriptions and the experiment protocol, you may refer to
the **chapter 2** of *./FAU_DiCoLabScript_2018*.

- **OFDM**: Orthogonal frequency-division multiplexing
(OFDM) is a well-known and popular technique to cope with these frequency-selective
channels. The aim of this experiment is to demonstrate the OFDM in dispersive channels and a simple bit loading algorithm.
For more details on individual task desriptions and the experiment protocol, you may refer to
the **chapter 4** of *./FAU_DiCoLabScript_2018*.

- **Signal Space Representation**: This experiment introduces the implementation of modulation schemes with signal elements.
Here we focus on memory-less modulation schemes such as Frequency Shift Keying (FSK).
For more details on individual task desriptions and the experiment protocol, you may refer to
the **chapter 5** of *./FAU_DiCoLabScript_2018*.

- **Signal Processing in MIMO Systems**: Modern digital communication systems employ multiple antennas at the transmitter and
the receiver side. Two basic principles can be distinguished which constitute the benefits
of multiple-input/multiple-output (MIMO) systems compared to single antenna systems:
On the one hand the multiplexing gain, i.e., the increased data rate due to transmission
of independent data streams over multiple transmit antennas. On the other hand, the
possibility to observe several independent copies of the transmit signal, e.g., through the
use of multiple receive antennas, and thus increased robustness to shadowing and noise
due to diversity.
For more details on individual task desriptions and the experiment protocol, you may refer to
the **chapter 6** of *./FAU_DiCoLabScript_2018*.

