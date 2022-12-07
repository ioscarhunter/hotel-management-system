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
  properties: {},
  estimateSize: _bookingTransactionEstimateSize,
  serialize: _bookingTransactionSerialize,
  deserialize: _bookingTransactionDeserialize,
  deserializeProp: _bookingTransactionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'room': LinkSchema(
      id: 5214084219576857947,
      name: r'room',
      target: r'Room',
      single: true,
    ),
    r'guest': LinkSchema(
      id: 1938548781632830822,
      name: r'guest',
      target: r'Guest',
      single: true,
    ),
    r'keyCard': LinkSchema(
      id: -2384100523792845298,
      name: r'keyCard',
      target: r'KeyCard',
      single: true,
    )
  },
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
) {}
BookingTransaction _bookingTransactionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookingTransaction();
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bookingTransactionGetId(BookingTransaction object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookingTransactionGetLinks(
    BookingTransaction object) {
  return [object.room, object.guest, object.keyCard];
}

void _bookingTransactionAttach(
    IsarCollection<dynamic> col, Id id, BookingTransaction object) {
  object.id = id;
  object.room.attach(col, col.isar.collection<Room>(), r'room', id);
  object.guest.attach(col, col.isar.collection<Guest>(), r'guest', id);
  object.keyCard.attach(col, col.isar.collection<KeyCard>(), r'keyCard', id);
}

extension BookingTransactionQueryWhereSort
    on QueryBuilder<BookingTransaction, BookingTransaction, QWhere> {
  QueryBuilder<BookingTransaction, BookingTransaction, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
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
}

extension BookingTransactionQueryFilter
    on QueryBuilder<BookingTransaction, BookingTransaction, QFilterCondition> {
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
}

extension BookingTransactionQueryObject
    on QueryBuilder<BookingTransaction, BookingTransaction, QFilterCondition> {}

extension BookingTransactionQueryLinks
    on QueryBuilder<BookingTransaction, BookingTransaction, QFilterCondition> {
  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      room(FilterQuery<Room> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'room');
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      roomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'room', 0, true, 0, true);
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      guest(FilterQuery<Guest> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'guest');
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      guestIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'guest', 0, true, 0, true);
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      keyCard(FilterQuery<KeyCard> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'keyCard');
    });
  }

  QueryBuilder<BookingTransaction, BookingTransaction, QAfterFilterCondition>
      keyCardIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'keyCard', 0, true, 0, true);
    });
  }
}

extension BookingTransactionQuerySortBy
    on QueryBuilder<BookingTransaction, BookingTransaction, QSortBy> {}

extension BookingTransactionQuerySortThenBy
    on QueryBuilder<BookingTransaction, BookingTransaction, QSortThenBy> {
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
}

extension BookingTransactionQueryWhereDistinct
    on QueryBuilder<BookingTransaction, BookingTransaction, QDistinct> {}

extension BookingTransactionQueryProperty
    on QueryBuilder<BookingTransaction, BookingTransaction, QQueryProperty> {
  QueryBuilder<BookingTransaction, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
