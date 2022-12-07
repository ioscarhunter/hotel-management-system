// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_transaction.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetBookingTransactionCollection on Isar {
  IsarCollection<BookingTransaction> get bookingTransactions =>
      this.collection();
}

const BookingTransactionSchema = CollectionSchema(
  name: r'BookingTransaction',
  id: -1522830740557236353,
  properties: {
    r'guestId': PropertySchema(
      id: 0,
      name: r'guestId',
      type: IsarType.long,
    ),
    r'keyCardId': PropertySchema(
      id: 1,
      name: r'keyCardId',
      type: IsarType.long,
    ),
    r'roomId': PropertySchema(
      id: 2,
      name: r'roomId',
      type: IsarType.long,
    )
  },
  estimateSize: _bookingTransactionEstimateSize,
  serialize: _bookingTransactionSerialize,
  deserialize: _bookingTransactionDeserialize,
  deserializeProp: _bookingTransactionDeserializeProp,
  idName: r'id',
  indexes: {
    r'roomId': IndexSchema(
      id: -3609232324653216207,
      name: r'roomId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'roomId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bookingTransactionGetId,
  getLinks: _bookingTransactionGetLinks,
  attach: _bookingTransactionAttach,
  version: '3.0.5',
);

int _bookingTransactionEstimateSize(
  BookingTransaction object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _bookingTransactionSerialize(
  BookingTransaction object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.guestId);
  writer.writeLong(offsets[1], object.keyCardId);
  writer.writeLong(offsets[2], object.roomId);
}

BookingTransaction _bookingTransactionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookingTransaction(
    reader.readLong(offsets[2]),
    reader.readLong(offsets[0]),
    reader.readLong(offsets[1]),
  );
  object.id = id;
  return object;
}

P _bookingTransactionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bookingTransactionGetId(BookingTransaction object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookingTransactionGetLinks(
    BookingTransaction object) {
  return [];
}

void _bookingTransactionAttach(
    IsarCollection<dynamic> col, Id id, BookingTransaction object) {
  object.id = id;
}

extension BookingTransactionByIndex on IsarCollection<BookingTransaction> {
  Future<BookingTransaction?> getByRoomId(int roomId) {
    return getByIndex(r'roomId', [roomId]);
  }

  BookingTransaction? getByRoomIdSync(int roomId) {
    return getByIndexSync(r'roomId', [roomId]);
  }

  Future<bool> deleteByRoomId(int roomId) {
    return deleteByIndex(r'roomId', [roomId]);
  }

  bool deleteByRoomIdSync(int roomId) {
    return deleteByIndexSync(r'roomId', [roomId]);
  }

  Future<List<BookingTransaction?>> getAllByRoomId(List<int> roomIdValues) {
    final values = roomIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'roomId', values);
  }

  List<BookingTransaction?> getAllByRoomIdSync(List<int> roomIdValues) {
    final values = roomIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'roomId', values);
  }

  Future<int> deleteAllByRoomId(List<int> roomIdValues) {
    final values = roomIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'roomId', values);
  }

  int deleteAllByRoomIdSync(List<int> roomIdValues) {
    final values = roomIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'roomId', values);
  }

  Future<Id> putByRoomId(BookingTransaction object) {
    return putByIndex(r'roomId', object);
  }

  Id putByRoomIdSync(BookingTransaction object, {bool saveLinks = true}) {
    return putByIndexSync(r'roomId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRoomId(List<BookingTransaction> objects) {
    return putAllByIndex(r'roomId', objects);
  }

  List<Id> putAllByRoomIdSync(List<BookingTransaction> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'roomId', objects, saveLinks: saveLinks);
  }
}

extension BookingTransactionQueryWhereSort
    on QueryBuilder<BookingTransaction, BookingTransaction, QWhere> {
  QueryBuilder<BookingTransaction, BookingTransaction, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterWhere>
      anyRoomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'roomId'),
      );
    });
  }
}

extension BookingTransactionQueryWhere
    on QueryBuilder<BookingTransaction, BookingTransaction, QWhereClause> {
  QueryBuilder<BookingTransaction, BookingTransaction, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterWhereClause>
      roomIdEqualTo(int roomId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'roomId',
        value: [roomId],
      ));
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterWhereClause>
      roomIdNotEqualTo(int roomId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'roomId',
              lower: [],
              upper: [roomId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'roomId',
              lower: [roomId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'roomId',
              lower: [roomId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'roomId',
              lower: [],
              upper: [roomId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterWhereClause>
      roomIdGreaterThan(
    int roomId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'roomId',
        lower: [roomId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterWhereClause>
      roomIdLessThan(
    int roomId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'roomId',
        lower: [],
        upper: [roomId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterWhereClause>
      roomIdBetween(
    int lowerRoomId,
    int upperRoomId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'roomId',
        lower: [lowerRoomId],
        includeLower: includeLower,
        upper: [upperRoomId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookingTransactionQueryFilter
    on QueryBuilder<BookingTransaction, BookingTransaction, QFilterCondition> {
  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      guestIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'guestId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      guestIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'guestId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      guestIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'guestId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      guestIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'guestId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      keyCardIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keyCardId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      keyCardIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'keyCardId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      keyCardIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'keyCardId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      keyCardIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'keyCardId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      roomIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      roomIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roomId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      roomIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roomId',
        value: value,
      ));
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      roomIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roomId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookingTransactionQueryObject
    on QueryBuilder<BookingTransaction, BookingTransaction, QFilterCondition> {}

extension BookingTransactionQueryLinks
    on QueryBuilder<BookingTransaction, BookingTransaction, QFilterCondition> {}

extension BookingTransactionQuerySortBy
    on QueryBuilder<BookingTransaction, BookingTransaction, QSortBy> {
  QueryBuilder<BookingTransaction, BookingTransaction, QAfterSortBy>
      sortByGuestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guestId', Sort.asc);
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterSortBy>
      sortByGuestIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guestId', Sort.desc);
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterSortBy>
      sortByKeyCardId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyCardId', Sort.asc);
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterSortBy>
      sortByKeyCardIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyCardId', Sort.desc);
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterSortBy>
      sortByRoomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomId', Sort.asc);
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterSortBy>
      sortByRoomIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomId', Sort.desc);
    });
  }
}

extension BookingTransactionQuerySortThenBy
    on QueryBuilder<BookingTransaction, BookingTransaction, QSortThenBy> {
  QueryBuilder<BookingTransaction, BookingTransaction, QAfterSortBy>
      thenByGuestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guestId', Sort.asc);
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterSortBy>
      thenByGuestIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guestId', Sort.desc);
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterSortBy>
      thenByKeyCardId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyCardId', Sort.asc);
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterSortBy>
      thenByKeyCardIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyCardId', Sort.desc);
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterSortBy>
      thenByRoomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomId', Sort.asc);
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterSortBy>
      thenByRoomIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomId', Sort.desc);
    });
  }
}

extension BookingTransactionQueryWhereDistinct
    on QueryBuilder<BookingTransaction, BookingTransaction, QDistinct> {
  QueryBuilder<BookingTransaction, BookingTransaction, QDistinct>
      distinctByGuestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'guestId');
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QDistinct>
      distinctByKeyCardId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keyCardId');
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QDistinct>
      distinctByRoomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roomId');
    });
  }
}

extension BookingTransactionQueryProperty
    on QueryBuilder<BookingTransaction, BookingTransaction, QQueryProperty> {
  QueryBuilder<BookingTransaction, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BookingTransaction, int, QQueryOperations> guestIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'guestId');
    });
  }

  QueryBuilder<BookingTransaction, int, QQueryOperations> keyCardIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keyCardId');
    });
  }

  QueryBuilder<BookingTransaction, int, QQueryOperations> roomIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roomId');
    });
  }
}
