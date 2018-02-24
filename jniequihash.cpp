#include <iostream>
#include <jni.h>
#include "jniequihash.h"
#include <pow.h>
#include <blake/blake2.h>

using namespace std;
using namespace _POW;

JNIEXPORT void JNICALL Java_jniequihash_runEquihash(JNIEnv *env, jobject object, jstring str) {
  const char *lstr;

  lstr = env->GetStringUTFChars(str, NULL);
  cout << lstr << endl;
  Seed seed = Seed(3);
  Equihash equihash(120,5,seed);
  Proof p = equihash.FindProof();
  p.Test();
}
