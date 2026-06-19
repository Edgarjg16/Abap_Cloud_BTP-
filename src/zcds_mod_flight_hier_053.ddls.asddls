@AccessControl.authorizationCheck:#NOT_REQUIRED
define hierarchy ZCDS_MOD_FLIGHT_HIER_053
  as parent child hierarchy(

    source ZCDS_FLIGHT_HIERA_053
    child to parent association _Agency

    start where AgencyId <> '000000'

    siblings order by AgencyId

    multiple parents allowed

    orphans ignore

    cycles breakup
  )
{
  AgencyId,
  CustomerId,


  $node.node_id               as NodeId,
  $node.parent_id             as ParentId,
  $node.hierarchy_is_cycle    as IsCycle,
  $node.hierarchy_is_orphan   as IsOrphan,
  $node.hierarchy_level       as HierarchyLevel,
  $node.hierarchy_parent_rank as ParentRank,
  $node.hierarchy_rank        as NodeRank,
  $node.hierarchy_tree_size   as TreeSize
}
