//bouton radio

/*@override
  Widget build(BuildContext context) {
    testTT? _testTT = testTT.test1;
    const TextStyle style = TextStyle(fontFamily: 'Courier New', fontSize: 30);
    return Scaffold(
      /*appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
               child: const Text('Title', style: style, textAlign: TextAlign.left,)
            ),
            //Padding(
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                width: 340,
                height: 419,
                color: Color.fromARGB(255, 170, 241, 168),
                child: Column(children: [
                  const Text('Quel age avez vous ?', style: TextStyle(fontSize: 19, fontFamily: 'Courier New', fontWeight: FontWeight.w600),),
                  ListTile(
                    title: const Text("test1", style: TextStyle(fontSize: 16, fontFamily: 'Courier New', fontWeight: FontWeight.w600)),
                    leading: Radio<testTT>(
                      groupValue: _testTT,
                      value: testTT.test1,
                      onChanged: (testTT? value){
                        setState(() {
                          _testTT = value;
                        });
                      },
                      )
                  ),
                  ListTile(
                    title: const Text("test2", style: TextStyle(fontSize: 16, fontFamily: 'Courier New', fontWeight: FontWeight.w600)),
                    leading: Radio<testTT>(
                      groupValue: _testTT,
                      value: testTT.test2,
                      onChanged: (testTT? value){
                        setState(() {
                          _testTT = value;
                        });
                      },
                      )
                  )
                ],
              )
            )

          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Color.fromARGB(255, 33, 167, 80),
            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const _MapPage(),
                ),
              );
            },
            child: const Text('Submit', style: TextStyle( fontSize: 25),),
          ),
        ],
        ),
      ),
      
      backgroundColor: Color.fromARGB(255, 86, 178, 117), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }*/