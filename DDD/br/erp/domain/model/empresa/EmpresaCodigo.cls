Class br.erp.domain.model.empresa.EmpresaCodigo [ ClassType = datatype, ClientDataType = LONGVARCHAR ]
{

ClassMethod IsValid(%val) As %Status
{
    if (%val = ""){
        quit $SYSTEM.Status.Error(5001, "Código inválido para empresa.")
    }
    quit $$$OK
}

}

