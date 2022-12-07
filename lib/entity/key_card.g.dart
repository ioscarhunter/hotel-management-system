// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_card.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetKeyCardCollection on Isar {
  IsarCollection<KeyCard> get keyCards => this.collection();
}

const KeyCardSchema = CollectionSchema(
  name: r'KeyCard',
  id: -1640417581910657952,
  properties: {
    r'bookingTransactionId': PropertySchema(
      id: 0,
      name: r'bookingTransactionId',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _keyCardEstimateSize,
  serialize: _keyCardSerialize,
  deserialize: _keyCardDeserialize,
  deserializeProp: _keyCardDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'bookingTransactionId': IndexSchema(
      id: 4948458780082013689,
      name: r'bookingTransactionId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bookingTransactionId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _keyCardGetId,
  getLinks: _keyCardGetLinks,
  attach: _keyCardAttach,
  version: '3.0.5',
);

int _keyCardEstimateSize(
  KeyCard object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _keyCardSerialize(
  KeyCard object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.bookingTransactionId);
  writer.writeString(offsets[1], object.name);
}

KeyCard _keyCardDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = KeyCard(
    reader.readString(offsets[1]),
  );
  object.bookingTransactionId = reader.readLongOrNull(offsets[0]);
  object.id = id;
  return object;
}

P _keyCardDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _keyCardGetId(KeyCard object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _keyCardGetLinks(KeyCard object) {
  return [];
}

void _keyCardAttach(IsarCollection<dynamic> col, Id id, KeyCard object) {
  object.id = id;
}

extension KeyCardByIndex on IsarCollection<KeyCard> {
  Future<KeyCard?> getByName(String name) {
    return getByIndex(r'name', [name]);
  }

  KeyCard? getByNameSync(String name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<KeyCard?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<KeyCard?> getAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'name', values);
  }

  Future<int> deleteAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'name', values);
  }

  int deleteAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'name', values);
  }

  Future<Id> putByName(KeyCard object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(KeyCard object, {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<KeyCard> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(List<KeyCard> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }

  Future<KeyCard?> getByBookingTransactionId(int? bookingTransactionId) {
    return getByIndex(r'bookingTransactionId', [bookingTransactionId]);
  }

  KeyCard? getByBookingTransactionIdSync(int? bookingTransactionId) {
    return getByIndexSync(r'bookingTransactionId', [bookingTransactionId]);
  }

  Future<bool> deleteByBookingTransactionId(int? bookingTransactionId) {
    return deleteByIndex(r'bookingTransactionId', [bookingTransactionId]);
  }

  bool deleteByBookingTransactionIdSync(int? bookingTransactionId) {
    return deleteByIndexSync(r'bookingTransactionId', [bookingTransactionId]);
  }

  Future<List<KeyCard?>> getAllByBookingTransactionId(
      List<int?> bookingTransactionIdValues) {
    final values = bookingTransactionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'bookingTransactionId', values);
  }

  List<KeyCard?> getAllByBookingTransactionIdSync(
      List<int?> bookingTransactionIdValues) {
    final values = bookingTransactionIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'bookingTransactionId', values);
  }

  Future<int> deleteAllByBookingTransactionId(
      List<int?> bookingTransactionIdValues) {
    final values = bookingTransactionIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'bookingTransactionId', values);
  }

  int deleteAllByBookingTransactionIdSync(
      List<int?> bookingTransactionIdValues) {
    final values = bookingTransactionIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'bookingTransactionId', values);
  }

  Future<Id> putByBookingTransactionId(KeyCard object) {
    return putByIndex(r'bookingTransactionId', object);
  }

  Id putByBookingTransactionIdSync(KeyCard object, {bool saveLinks = true}) {
    return putByIndexSync(r'bookingTransactionId', object,
        saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByBookingTransactionId(List<KeyCard> objects) {
    return putAllByIndex(r'bookingTransactionId', objects);
  }

  List<Id> putAllByBookingTransactionIdSync(List<KeyCard> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'bookingTransactionId', objects,
        saveLinks: saveLinks);
  }
}

extension KeyCardQueryWhereSort on QueryBuilder<KeyCard, KeyCard, QWhere> {
  QueryBuilder<KeyCard, KeyCard, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhere> anyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'name'),
      );
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhere> anyBookingTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'bookingTransactionId'),
      );
    });
  }
}

extension KeyCardQueryWhere on QueryBuilder<KeyCard, KeyCard, QWhereClause> {
  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause> nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause> nameNotEqualTo(
      String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause> nameGreaterThan(
    String name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [name],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause> nameLessThan(
    String name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [],
        upper: [name],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause> nameBetween(
    String lowerName,
    String upperName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [lowerName],
        includeLower: includeLower,
        upper: [upperName],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause> nameStartsWith(
      String NamePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [NamePrefix],
        upper: ['$NamePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [''],
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'name',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'name',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'name',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'name',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause>
      bookingTransactionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'bookingTransactionId',
        value: [null],
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause>
      bookingTransactionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'bookingTransactionId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause> bookingTransactionIdEqualTo(
      int? bookingTransactionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'bookingTransactionId',
        value: [bookingTransactionId],
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause>
      bookingTransactionIdNotEqualTo(int? bookingTransactionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingTransactionId',
              lower: [],
              upper: [bookingTransactionId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingTransactionId',
              lower: [bookingTransactionId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingTransactionId',
              lower: [bookingTransactionId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingTransactionId',
              lower: [],
              upper: [bookingTransactionId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause>
      bookingTransactionIdGreaterThan(
    int? bookingTransactionId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'bookingTransactionId',
        lower: [bookingTransactionId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause>
      bookingTransactionIdLessThan(
    int? bookingTransactionId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'bookingTransactionId',
        lower: [],
        upper: [bookingTransactionId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterWhereClause> bookingTransactionIdBetween(
    int? lowerBookingTransactionId,
    int? upperBookingTransactionId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'bookingTransactionId',
        lower: [lowerBookingTransactionId],
        includeLower: includeLower,
        upper: [upperBookingTransactionId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension KeyCardQueryFilter
    on QueryBuilder<KeyCard, KeyCard, QFilterCondition> {
  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition>
      bookingTransactionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bookingTransactionId',
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition>
      bookingTransactionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bookingTransactionId',
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition>
      bookingTransactionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingTransactionId',
        value: value,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition>
      bookingTransactionIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookingTransactionId',
        value: value,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition>
      bookingTransactionIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookingTransactionId',
        value: value,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition>
      bookingTransactionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookingTransactionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension KeyCardQueryObject
    on QueryBuilder<KeyCard, KeyCard, QFilterCondition> {}

extension KeyCardQueryLinks
    on QueryBuilder<KeyCard, KeyCard, QFilterCondition> {}

extension KeyCardQuerySortBy on QueryBuilder<KeyCard, KeyCard, QSortBy> {
  QueryBuilder<KeyCard, KeyCard, QAfterSortBy> sortByBookingTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingTransactionId', Sort.asc);
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterSortBy>
      sortByBookingTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingTransactionId', Sort.desc);
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension KeyCardQuerySortThenBy
    on QueryBuilder<KeyCard, KeyCard, QSortThenBy> {
  QueryBuilder<KeyCard, KeyCard, QAfterSortBy> thenByBookingTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingTransactionId', Sort.asc);
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterSortBy>
      thenByBookingTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingTransactionId', Sort.desc);
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<KeyCard, KeyCard, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension KeyCardQueryWhereDistinct
    on QueryBuilder<KeyCard, KeyCard, QDistinct> {
  QueryBuilder<KeyCard, KeyCard, QDistinct> distinctByBookingTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookingTransactionId');
    });
  }

  QueryBuilder<KeyCard, KeyCard, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension KeyCardQueryProperty
    on QueryBuilder<KeyCard, KeyCard, QQueryProperty> {
  QueryBuilder<KeyCard, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<KeyCard, int?, QQueryOperations> bookingTransactionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookingTransactionId');
    });
  }

  QueryBuilder<KeyCard, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
