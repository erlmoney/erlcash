%%%-------------------------------------------------------------------
%%% @author Madalin Grigore-Enescu
%%% @copyright (C) 2017, Madalin Grigore-Enescu <os@ergenius.com>
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(erlcash_sup).
-author("Madalin Grigore-Enescu").

-behaviour(supervisor).

-include_lib("erlcash/include/erlcash.hrl").

%% supervisor exports
-export([start_link/2]).
-export([init/1]).
-export([upgrade/0]).

%% @doc Creates a supervisor process as part of a supervision tree.
start_link(SupName, Args) ->

    supervisor:start_link(SupName, ?MODULE, Args).

%% @doc Returns supervisor flags and child specifications.
init(Args) ->

    %% Get erlcash main supervisor configuration parameters
    RestartIntensity    = erlcash_utils:config_get_value(sup_restart_intensity, Args, ?ERLCASH_DEFAULT_SUP_RESTART_INTENSITY),
    RestartPeriod       = erlcash_utils:config_get_value(sup_restart_period, Args, ?ERLCASH_DEFAULT_SUP_RESTART_INTENSITY),
    PoolsConfig         = erlcash_utils:config_get_value(pools, Args, []),

    SrvGroupingName     = erlcash_utils:config_get_value(srv_grouping_name, Args, ?ERLCASH_DEFAULT_SRV_GROUPING_NAME),
    SrvGroupingShutdown = erlcash_utils:config_get_value(srv_grouping_shutdown, Args, ?ERLCASH_DEFAULT_SRV_GROUPING_SHUTDOWN),

    %% Iterate pools config list and build pools child specifications
    PoolsChildSpecs     = [erlcash_utils:pool_config_to_child_specs(PoolConfig) || PoolConfig <- PoolsConfig],

    %% Add grouping child to the supervisor children specifications
    ChildSpecs   = [{
                        SrvGroupingName,
                        {erlcash_srv_grouping, start_link, [Args]},
                        permanent,
                        SrvGroupingShutdown,
                        worker,
                        [erlcash_srv_grouping]
                    } | PoolsChildSpecs],

    %% Returns supervisor flags and child specifications
    {ok, {{one_for_one, RestartIntensity, RestartPeriod}, ChildSpecs}}.

%% @spec upgrade() -> ok
%% @doc Handle the upgrade process.
upgrade() -> ok.
