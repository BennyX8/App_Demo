import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'model.g.dart';

const productsTable = SqfEntityTable(
    tableName: 'products',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: false,
    fields: [
      SqfEntityField('name', DbType.text),
      SqfEntityField('cost', DbType.numeric),
      SqfEntityField('price', DbType.numeric),
      SqfEntityField('image', DbType.text),
    ]);

const seqId = SqfEntitySequence(
  sequenceName: 'identity',
);

@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
  modelName: 'MyAppDabModel',
  databaseName: 'demoapp-db.db',
  sequences: [seqId],
  databaseTables: [productsTable],
);
