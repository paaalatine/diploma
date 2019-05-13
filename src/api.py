app = Flask(__name__)

@app.route('/search', methods=['GET'])
def search():
	input = request.args.get('q')
	predicted, proba = mlsearch.predict(input)
	return jsonify(predicted=predicted, proba=proba)

if __name__ == '__main__':
    app.run()