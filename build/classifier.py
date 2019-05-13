t0 = time()
self.clf.fit(X, y)
print("done in %fs" % (time() - t0))