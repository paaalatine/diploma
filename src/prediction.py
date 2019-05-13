t0 = time()

predicted = self.clf.predict(input_vectors)[0]

spaces = self.clf.decision_function(input_vectors)[0]

print("\nprediction done in %fs" % (time() - t0))

space = spaces[np.where(self.clf.classes_ == predicted)]
proba = 1 / (1 + exp(-space))

