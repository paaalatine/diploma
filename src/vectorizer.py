X, y = search.read_dataset();

t0 = time()
self.vectorizer.fit(X)
print('vectorizer fitted in %fs' % (time() - t0,))

X = self.vectorizer.transform(X)