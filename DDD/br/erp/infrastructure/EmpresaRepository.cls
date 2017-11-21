Class br.erp.infrastructure.EmpresaRepository Extends (%Persistent, br.erp.domain.model.empresa.EmpresaRepository)
{

Method procurar(empresaId As br.erp.domain.model.empresa.EmpresaId) As br.erp.domain.model.empresa.Empresa
{
    if (..%ExistsId( empresaId )){
        quit ..%OpenId( empresaId )
    }
    $$$ThrowOnError( $$$ERROR(5001, "Empresa não encontrada."))
}

Method procurarTodos() As %ListOfObjects
{
    
    
    #dim statement As %SQL.Statement
    #dim sql As %String = "SELECT ID FROM br_erp_infrastructure.Empresa"
    #dim lista As %ListOfObjects
    
    set lista = ##class(%ListOfObjects).%New()
    set statement = ##class(%SQL.Statement).%ExecDirect(,sql)
    while (statement.%Next()){
        do lista.Insert( ##class(br.erp.infrastructure.Empresa).%OpenId( statement.ID ))
    }
    quit lista
}

Method registar(empresa As br.erp.domain.model.empresa.Empresa) As %Status
{
    if (..%ExistsId( empresa.id )){
        set empresaNova = ..%OpenId( empresa.id )
    } else {
        set empresaNova = ..%New()
    }
    
    set empresaNova.descricao = ""
    set empresaNova.cnpj = empresa.cnpj
    $$$ThrowOnError( empresaNova.%Save() )
}

Property descricao As %String;

Property cnpj As %String;

Storage Default
{
<Data name="EmpresaRepositoryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>descricao</Value>
</Value>
<Value name="3">
<Value>cnpj</Value>
</Value>
</Data>
<DataLocation>^br.erp.infC019.EmpresaRepo13CAD</DataLocation>
<DefaultData>EmpresaRepositoryDefaultData</DefaultData>
<IdLocation>^br.erp.infC019.EmpresaRepo13CAD</IdLocation>
<IndexLocation>^br.erp.infC019.EmpresaRepo13CAI</IndexLocation>
<StreamLocation>^br.erp.infC019.EmpresaRepo13CAS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}

