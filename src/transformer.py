t0 = time()
self.tfidf.fit(X)
print('tfidf fitted in %fs' % (time() - t0,))

X = self.tfidf.transform(X)