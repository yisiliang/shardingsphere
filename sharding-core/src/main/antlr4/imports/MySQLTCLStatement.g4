grammar MySQLTCLStatement;

import MySQLKeyword, Keyword, Symbol, BaseRule, DataType;

setTransaction
    : SET (GLOBAL | SESSION)? TRANSACTION setTransactionCharacteristic (COMMA_ setTransactionCharacteristic)*
    ;
    
setTransactionCharacteristic
    : ISOLATION LEVEL level | accessMode
    ;
    
level
    : REPEATABLE READ | READ (COMMITTED | UNCOMMITTED) | SERIALIZABLE
    ;
    
accessMode
    : READ (WRITE | ONLY)
    ;
    
commit
    : COMMIT WORK? (AND NO? CHAIN)? (NO? RELEASE)?
    ;
    
beginTransaction
    : BEGIN WORK? | startTransaction
    ;
    
startTransaction
    : START TRANSACTION (startTransactionCharacteristic (COMMA_ startTransactionCharacteristic)*)?
    ;
    
startTransactionCharacteristic
    : WITH CONSISTENT SNAPSHOT | READ (WRITE | ONLY)
    ;
    
rollback
    : ROLLBACK WORK? ((AND NO? CHAIN)? (NO? RELEASE)? | TO SAVEPOINT? ID)
    ;
    
savepoint
    : SAVEPOINT ID 
    ;
    
setAutoCommit
    : SET AUTOCOMMIT EQ_ autoCommitValue
    ;

autoCommitValue
    : NUMBER_
    ;
