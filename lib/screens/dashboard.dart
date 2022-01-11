import 'package:bytebankk/screens/contacts_list.dart';
import 'package:bytebankk/screens/name.dart';
import 'package:bytebankk/screens/transaction_list.dart';
//import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NameCubit('Guilherme'),

      //funciona , mas bizarro, blocProvider + BlocBuilder
      child: Dashboard(), 
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final name = context.read<NameCubit>().state;
    return Scaffold(
      appBar: AppBar(
        //misturardo um blocBuilder(que é um observador de eventos) com UI
        title: BlocBuilder<NameCubit, String>(
        builder: (context, state) => Text('Welcome $state'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          SingleChildScrollView(
            child: Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,            
                  children: <Widget>[         
                    _FeatureItem(
                      'Transfer', 
                      Icons.monetization_on,
                      onClick: () => _showContactsList(context),
                      
                    ),
                    _FeatureItem(
                      'Transaction Feed', 
                      Icons.description, 
                      onClick: () => _showTransactionsList(context),
                    ),     
                                      _FeatureItem(
                      'Change name', 
                      Icons.person_outline ,
                      onClick: () => _showChangeName(context),
                    ),             
                 ],
                ),
              ),
          ),          
        ],
      ),
    );
  }

  void _showContactsList(BuildContext context){
    
    //FirebaseCrashlytics.instance.crash();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => ContactsList(),
      ),
    );
  }

  void  _showChangeName(BuildContext blocContext) {
        Navigator.of(blocContext).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(value: BlocProvider.of<NameCubit>(blocContext),
        child: NameContainer()),
      ),
    );
  }

  _showTransactionsList(BuildContext context) {
        Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => TransactionsList(),
      ),
    );
  }


}

class _FeatureItem extends StatelessWidget {
  
  final String name;
  final IconData icon;
  final Function onClick;

  _FeatureItem(this.name, this.icon, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: () => onClick(),                
                child: Container(
                  height: 100,
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        icon,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}