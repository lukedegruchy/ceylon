void destructuring([Integer,Integer, String] tuple, String->Float entry) {
    value [i,j,str] = tuple;
    Integer ii = i;
    Integer jj = j;
    String s = str;
    value [Integer i_,value j_,@error Float str_] = tuple;
    @error value [x,y] = tuple;
    value [a,b,c,@error d,@error e] = tuple;
    @error value [z] = "";
    value name->quantity = entry;
    String n = name;
    Float q = quantity;
    value @error Integer name_->Float quantity_ = entry;
}

void variadicDestructuring([String, String, String*] strings, 
    [Integer, Float, String] tup, 
    [Float+] floats) {
    value [@type:"String" x, @type:"String" y, @type:"Sequential<String>" *rest] = strings;
    String[] s_ = rest;
    value [@type:"Integer" i, @type:"Tuple<Float|String,Float,Tuple<String,String,Empty>>" *pair] = tup;
    value [Float ff, String ss] = pair;
    value [@type:"Float" z, @type:"Sequential<Float>" *zs] = floats;
    Float[] xs_ = zs;
    
}

void destructureTupleInEntry(String->[Float,Float] entry) {
    value @type:"String" s->[@type:"Float" x, @type:"Float" y] = entry;
    value z = let (@type:"String" s_->[@type:"Float" x_, @type:"Float" y_] = entry) x_*y_;
    String ss = s;
    Float xx = x;
    Float yy = y;
}

void destructureNestedTuple([String,[Integer,Float],String->String] tuple) {
    value [@type:"String" s, [@type:"Integer" i, @type:"Float" f], @type:"String" k -> @type:"String" v] = tuple;
    value x = let ([@type:"String" s_, [@type:"Integer" i_,@type:"Float" f_], @type:"String" k_ -> @type:"String" v_] = tuple) k_+v_;
    String ss = s;
    Integer ii = i;
    Float ff = f;
    String kk = k;
    String vv = v;
    value [[xx,yy],zz] = [[1,2],4];
}

void brokenDestructuring([String,[Integer,Float],String->String] tuple) {
    @error value [s,[i,f],k->v];
    //@error value x = let ([s_,[i_,f_],k_->v_] ) k_+v_;
}

void destructureInFor({[String, Float, String->String]*} iter) {
    for ([x, y, s1->s2] in iter) {
        String s = x;
        Float f = y;
        String->String e = s1->s2;
    }
    for ([String x, Float y, String s1 -> String s2] in iter) {
        String s = x;
        Float f = y;
        String->String e = s1->s2;
    }
}

void destructureIf([Float, Integer]? maybePair, String[] names, <String->Object>? maybeEntry) {
    if (exists [@type:"Float" x, @type:"Integer" i] = maybePair) {
        Float c = x;
        Integer j = i;
    }
    if (nonempty [@type:"String" name, *rest] = names) {
        String n = name;
        String[] ns = rest;
    }
    if (exists @type:"String" k -> @type:"Object" v = maybeEntry) {
        String key = k;
        Object item = v;
    }
    assert (exists [@type:"Float" float,@type:"Integer" int] = maybePair, 
            exists @type:"String" key->@type:"Object" item = maybeEntry);
    Float float_ = float;
    Integer int_ = int;
    String key_ = key;
    Object item_ = item;
    while (exists [x_, i_] = maybePair, 
           exists s_->o_ = maybeEntry, 
           nonempty [f_,*r_] = names) {
        Float x__ = x_;
        Integer i__ = i_;
        String s__ = s_;
        Object o__ = o_;
        String f__ = f_;
        String[] r__ = r_;
    }
}