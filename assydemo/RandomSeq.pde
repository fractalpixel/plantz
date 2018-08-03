
// Random Sequence
class RandomSequence {
  long state0 = 0;
  long state1 = 0;
  
  boolean haveExtraGaussian = false;
  private double extraGaussian;
  
  RandomSequence() {
    setHashedSeed(hash(System.nanoTime()));        
  }
  
  RandomSequence(long seed) {
    setHashedSeed(hash(seed));        
  }
  
  void setHashedSeed(long seed) {
     state0 = seed;

     // Derive second seed from the original using a hash function
     state1 = hash(hash(seed));

     // Replace zero seeds with arbitrary seeds
     if (state0 == 0L) state0 = 9045324987L;
     if (state1 == 0L) state1 = 3912353188L;
  }
  
  void setSeed(double seed, double ... additionalSeeds) {
    // Hash the user provided seeds to spread them out over the long space.
    // Combine several seeds by hashing and xoring them together
    // Maps double bits to longs
  
    long hashedSeed = hash(java.lang.Double.doubleToLongBits(seed));
  
    for (double additionalSeed : additionalSeeds) {
        hashedSeed = hash(hashedSeed);
        hashedSeed = hashedSeed ^ hash(java.lang.Double.doubleToLongBits(additionalSeed));
    }
  
    hashedSeed = hash(hashedSeed);
  
    // Clear any cached generated gaussian
    haveExtraGaussian = false;
  
    setHashedSeed(hashedSeed);
  }
  
    boolean nextBoolean(double probabilityForTrue) {
        return nextDouble() < probabilityForTrue;
    }

    boolean nextBoolean(float probabilityForTrue) {
        return nextFloat() < probabilityForTrue;
    }

    int nextInt() {
        return (int)(nextLong() >> 32); // Use signed right shift
    }
    
    int nextInt(int minInt, int maxInt) {
      return nextInt() % (maxInt - minInt) + minInt;
    }
    
    int nextInt(int maxInt) {
      return nextInt(0, maxInt);
    }
    
    float nextFloat() {
      return nextBits(24) / (float)(1 << 24);
    }
    
    float nextFloat(float max) {
        if (max < 0) throw new IllegalArgumentException("max should not be negative, but it was " + max);

        return nextFloat() * max;
    }

    float nextFloat(float min, float max) {
      return min(min, max) + nextFloat(abs(max-min));
    }

    float nextGaussishFloat(float mean, float stdDev) {
      return nextFloat(-1f, 1f) *
             nextFloat(-1f, 1f) *
             nextFloat(-1f, 1f) *
             nextFloat(-1f, 1f) *
             stdDev + mean;
    }


/*
    double nextGaussian() {
        if (haveExtraGaussian) {
            // Use earlier extra gaussian if available
            haveExtraGaussian = false;
            return extraGaussian;
        } else {
            double linearRandom1;
            double linearRandom2;
            double squaredDistance;
            do {
                // Generate two linear random numbers in -1 .. 1 range
                linearRandom1 = 2 * nextDouble() - 1;
                linearRandom2 = 2 * nextDouble() - 1;
                squaredDistance = linearRandom1 * linearRandom1 + linearRandom2 * linearRandom2;
            } while (squaredDistance >= 1 || squaredDistance == 0.0);

            double multiplier = StrictMath.sqrt(-2 * StrictMath.log(squaredDistance) / squaredDistance);

            double gaussian = linearRandom1 * multiplier;

            // Store the extra random gaussian for future use
            extraGaussian = linearRandom2 * multiplier;
            haveExtraGaussian = true;

            return gaussian;
        }
    }

    float nextGaussianFloat() {
        return (float)nextGaussian();
    }

    float nextGaussianFloat(float mean, float standardDeviation) {
        return (float) nextGaussian() * standardDeviation + mean;
    }


    double nextGaussian(double mean, double standardDeviation) {
        return nextGaussian() * standardDeviation + mean;
    }

*/
    double nextDouble() {
        return nextBits(53) / (double)(1L << 53);
    }


    private long nextBits(int numberOfBits) {
        return nextLong() >>> (64 - numberOfBits); // Use unsigned right shift, most significant bits will be zero
        // and the number will be positive if numberOfBits > 0
    }



  long nextLong() {

        long result = state0 + state1;

        long t1 = state1 ^  state0;
        state0 = (java.lang.Long.rotateLeft(state0, 55) ^ t1) ^ (t1 << 14); // a, b
        state1 = java.lang.Long.rotateLeft(t1, 36); // c

        return result;
    }

  

    RandomSequence nextRandom() {
        return new RandomSequence(nextLong());
    }

  
    long hash(long input) {
        long value = input;

        // If the input is zero, replace it with an arbitrary non-zero constant
        if (value == 0L) value = 8726312;

        value = value ^ (value >>> 33);
        value *= CONSTANT_A;
        value = value ^ (value >>> 33);
        value *= CONSTANT_B;
        return value ^ (value >>> 33);
    }
    
   public static final long CONSTANT_A = 0xff51afd7ed558ccdL;
    public static final long CONSTANT_B = 0xc4ceb9fe1a85ec53L;

}
