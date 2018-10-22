Class br.erp.domain.model.cliente.ClienteUID extends br.erp.domain.shared.ValueObject [Final]
{

    Property uid As %String [ Private ];

    ClassMethod create(uid As %String = "") As UID
    {
        return ..%New(uid)
    }

    Method %OnNew(uid As %String) As %Status
    {
        set ..uid = uid
        return $$$OK
    }

    Method generate() As %Status [ Final ]
    {
        if (..isEmpty()){
            set ..uid = $SYSTEM.Util.CreateGUID()
        }
    }

    Method isEmpty() As %Boolean [ Final ]
    {
        return (..uid = "")
    }

    Method getUID() As %String [ Final ]
    {
        return ..uid
    }
    
}